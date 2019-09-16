require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do

    location = "Denver, CO"

    get "/api/v1/gifs?location=#{location}"

    gif = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(gif[:data][:images].first[:url].class).to eq(String)
    expect(gif[:data][:images].first[:day].class).to eq(String)
    expect(gif[:data][:images].first[:summary].class).to eq(String)
    # expect(gif[:data][:images].count).to eq(5)
  end
end
