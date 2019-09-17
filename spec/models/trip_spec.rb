require 'rails_helper'

describe Trip do
  it "exists" do

    json = File.read("./fixtures/directions_den_to_pueblo.json")
    info = JSON.parse(json, symbolize_names: true)[:routes][0][:legs]

    trip = Trip.new(info)

    expect(trip).to be_a Trip
  end
end
