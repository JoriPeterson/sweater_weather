require 'rails_helper'

describe "Giphy Request API" do
  it "retrieves a gif for the city" do
    stub_json("https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392,-104.9903?exclude=minutely", "./fixtures/darksky_denver.json")
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GEOCODE_API_KEY"]}", "./fixtures/geocode_denver.json")
    stub_json("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_API_KEY"]}&q=Mostly%20cloudy%20throughout%20the%20day.", "./fixtures/giphy_denver.json")

    location = "denver, co"

    get "/api/v1/gifs?location=#{location}"

    gif = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(gif[:data][:images].first[:url].class).to eq(String)
    expect(gif[:data][:images].first[:day].class).to eq(String)
    expect(gif[:data][:images].first[:summary].class).to eq(String)
    # expect(gif[:data][:images].count).to eq(5)
  end
end
