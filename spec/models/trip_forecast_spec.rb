require 'rails_helper'

describe TripForecast do
  it "exists" do
    duration = "1 hours 46 minutes"

    json = File.read("./fixtures/time_machine_pueblo.json")
    forecast = JSON.parse(json, symbolize_names: true)[:currently]

    trip_forecast = TripForecast.new(forecast, duration)

    expect(trip_forecast).to be_a TripForecast
  end
end
