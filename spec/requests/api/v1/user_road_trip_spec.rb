require 'rails_helper'

describe "User Roadtrip API" do
  it "takes an api key and returns future forecast info" do
    stub_json("https://maps.googleapis.com/maps/api/directions/json?destination=Pueblo,CO&key=#{ENV["GEOCODE_API_KEY"]}&origin=", "./fixtures/directions_den_to_pueblo.json")
    WebMock.allow_net_connect!

    user = User.create!(email: "whatever@example.com", password: "password", api_key: "d450965fb2f168d4ddc607")

    post "/api/v1/road_trip", params: { "origin" => "Denver,CO", "destination" => "Pueblo,CO", "api_key" => "#{user.api_key}" }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(info[:data][:attributes][:estimated_travel_time]).to eq("1 hour 46 mins")
    expect(info[:data][:attributes][:temperature].class).to eq(Integer)
    expect(info[:data][:attributes][:summary].class).to eq(String)
  end
end
