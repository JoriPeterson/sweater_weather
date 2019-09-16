require 'rails_helper'

describe "Forecast API" do
  it "retrieves the forcast" do

    location = "Denver, CO"

    get "/api/v1/gifs?location=#{location}"

    gif = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(gif[:images].first[:time].class).to eq(String)
    expect(gif[:images].first[:summary].class).to eq(String)
  end
end
