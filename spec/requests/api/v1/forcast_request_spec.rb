require 'rails_helper'

describe "Forcast API" do
  it "retrieves the forcast" do
    location = Location.create!(city: "denver", state: CO, lat: "...", lon: "...")

    get '/api/v1/forecast?'
    GET "/api/v1/forecast?location=#{location.city},#{location.state}"

    forcast = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(forcast.count).to eq(3)
  end
end
