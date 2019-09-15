require 'rails_helper'

describe "Forcast API" do
  it "retrieves the forcast" do
    location = Location.create!(city: "denver", state: CO, lat: "...", lon: "...")

    get "api.darksky.net/forecast/#{ENV(DARKSKY_API_KEY)}/#{location.lat},#{location.lon}"

    forcast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(forcast.count).to eq(3)
  end
end
