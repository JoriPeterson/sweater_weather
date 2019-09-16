require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do

    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"


    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(forecast[:attributes][:current_summary].class).to eq(String)
    expect(forecast[:attributes][:current_temp].class).to eq(Integer)
    expect(forecast[:attributes][:hourly].class).to eq(Array)
    expect(forecast[:attributes][:daily].class).to eq(Array)
  end
end
