require 'rails_helper'

describe "User Roadtrip API" do
  it "takes an api key and returns future forecast info" do
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV["GEOCODE_API_KEY"]}", "./fixtures/geocode_denver.json")
    # stub_json("https://maps.googleapis.com/maps/api/directions/json?origin=Denver,CO&destination=Pueblo,CO&key=#{ENV["GEOCODE_API_KEY"]}", "./fixtures/directions_den_to_pueblo.json")
    stub_json("https://maps.googleapis.com/maps/api/directions/json?destination=Pueblo,CO&key=AIzaSyCRySaQvXzqSfds4VdpR9R1pYLXgfIDFJ4&origin=", "./fixtures/directions_den_to_pueblo.json")

    user = User.create!(email: "whatever@example.com", password: "password", api_key: "d450965fb2f168d4ddc607")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post "/api/v1/road_trip", params: { "origin" => "Denver,CO", "destination" => "Pueblo,CO", "api_key" => "#{user.api_key}" }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(info[:forecast]).to eq("")
  end
end
