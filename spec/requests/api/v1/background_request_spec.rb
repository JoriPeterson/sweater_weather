require 'rails_helper'

describe "Background Image API" do
  it "retrieves a background image" do
    stub_json("https://api.unsplash.com/search/photos/?client_id=#{ENV["UNSPLASH_API_KEY"]}&query=denver,co%2Bcity", "./fixtures/unsplash_denver.json")

    location = "denver,co"

    get "/api/v1/backgrounds?location=#{location}"

    background = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(background[:image].class).to eq(String)
  end
end
