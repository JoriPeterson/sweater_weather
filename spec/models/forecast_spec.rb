require 'rails_helper'

describe Forecast do
  it "exists" do
    json = File.read("./fixtures/darksky_denver.json")
    info = JSON.parse(json, symbolize_names: true)

    var =  [{:address_components=>
            [{:long_name=>"Denver", :short_name=>"Denver", :types=>["locality", "political"]},
            {:long_name=>"Denver County", :short_name=>"Denver County", :types=>["administrative_area_level_2", "political"]},
            {:long_name=>"Colorado", :short_name=>"CO", :types=>["administrative_area_level_1", "political"]},
            {:long_name=>"United States", :short_name=>"US", :types=>["country", "political"]}],
            :geometry=>
            {:bounds=>{:northeast=>{:lat=>39.91424689999999, :lng=>-104.6002959}, :southwest=>{:lat=>39.614431, :lng=>-105.109927}},
              :location=>{:lat=>39.7392358, :lng=>-104.990251}}}]

    address = Location.new(var)

    forecast = Forecast.new(info, address)

    expect(forecast).to be_a Forecast
  end
end
