require 'rails_helper'

describe "Background Image API" do
  it "retrieves a background image" do

    location = "Denver, CO"

    get "/api/v1/backgrounds?location=#{location}"

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(forecast[:attributes][:city]).to eq("Denver")
    expect(forecast[:attributes][:state]).to eq("CO")
  end
end
