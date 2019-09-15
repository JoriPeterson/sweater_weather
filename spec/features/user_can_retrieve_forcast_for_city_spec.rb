require 'rails_helper'

describe "As a user" do
  it "I can retrieve a forecast for a city" do
    stub_json("https://maps.googleapis.com/maps/api/geocode/json?", "./fixtures/geocode_denver.json")

    location = "Denver, CO"

    visit "/api/v1/forecast?location=#{location}"

    expect(current_path).to eq("/api/v1/forecast?location=denver,co")
    expect(current_page).to have_content("Denver, CO")
    expect(current_page).to have_content("United States")
    expect(current_page).to have_link("Change Location")
    expect(current_page).to have_link("favorite")
  end
end
