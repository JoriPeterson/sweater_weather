require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do
    stub_json("https://api.darksky.net/forecast/#{ENV["DARKSKY_API_KEY"]}/39.7392,-104.9903?exclude=minutely", "./fixtures/darksky_denver.json")
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=denver%2Bco&key=#{ENV["GEOCODE_API_KEY"]}", "./fixtures/geocode_denver.json")

    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(forecast[:attributes][:city]).to eq("Denver")
    expect(forecast[:attributes][:state]).to eq("CO")
    expect(forecast[:attributes][:current_summary].class).to eq(String)
    expect(forecast[:attributes][:current_temp].class).to eq(Integer)
    expect(forecast[:attributes][:hourly].class).to eq(Array)
    expect(forecast[:attributes][:daily].class).to eq(Array)
  end
end
