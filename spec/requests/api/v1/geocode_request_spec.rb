require 'rails_helper'

describe "Geocode API" do
  it "retrieves the location" do

    location = "Denver, CO"

    get "/api/v1/forecast?location=#{location}"

    location_details = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(location_details[0][:attributes][:city]).to eq("Denver")
    expect(location_details[0][:attributes][:state]).to eq("CO")
    expect(location_details[0][:attributes][:country]).to eq("United States")
    expect(location_details[0][:attributes][:lat]).to eq(39.7392)
    expect(location_details[0][:attributes][:lng]).to eq(-104.9903)
  end

  it 'retrieves the forecast' do
    
  end
end
