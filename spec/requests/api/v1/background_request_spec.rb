require 'rails_helper'

describe "Background Image API" do
  it "retrieves a background image" do
    stub_json("https://api.unsplash.com/photos/?client_id=#{ENV["UNSPLASH_API_KEY"]}&query=Denver%2BCO", "./fixtures/unsplash_denver.json")

    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    background = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(background[:image].class).to eq(String)
  end
end
