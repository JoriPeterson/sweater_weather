require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do
    stub_json("https://api.darksky.net/forecast/", "./fixtures/darksky_denver.json")
    stub_json("https://maps.googleapis.com/maps/api/geocode/json", "./fixtures/geocode_denver.json")
    location = "Denver, CO"

    WebMock.allow_net_connect!
    get "/api/v1/forecast?location=#{location}"
    WebMock.disable_net_connect!

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    # expect(forecast[:attributes][:current_summary]).to eq("Partly Cloudy")
    # expect(forecast[:attributes][:current_icon]).to eq("partly-cloudy-night")
    # expect(forecast[:attributes][:current_temp]).to eq(75)
    # expect(forecast[:attributes][:feels_like]).to eq(75)
    # expect(forecast[:attributes][:humidity]).to eq(0.23)
    # expect(forecast[:attributes][:uv_index]).to eq(0)
    # expect(forecast[:attributes][:visibility]).to eq(5.70)
    # expect(forecast[:attributes][:todays_summary]).to eq( "No precipitation throughout the week, with high temperatures falling to 80°F on Saturday.")
    # expect(forecast[:attributes][:daily_icon]).to eq("clear-day")
    # expect(forecast[:attributes][:high_temp]).to eq(90)
    # expect(forecast[:attributes][:low_temp]).to eq(63)
    expect(forecast[:attributes][:hourly].class).to eq(Array)
    expect(forecast[:attributes][:daily].class).to eq(Array)
  end
end
