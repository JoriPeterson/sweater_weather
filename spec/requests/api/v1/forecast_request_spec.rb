require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do
    lat = 39.7392358
    lng = -104.990251

    get "api.darksky.net/forecast/#{ENV(DARKSKY_API_KEY)}/#{lat},#{lng}"

    forcast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(forcast.count).to eq(3)
  end
end
