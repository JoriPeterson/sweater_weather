require 'rails_helper'

describe "As a user" do
  it "I can retrieve a forcast for a city" do

    visit "/api/v1/forecast?location=denver,co"

    expect(current_path).to eq("/forcast?location=denver,co")
    expect(current_page).to have_content("Denver, CO")
    expect(current_page).to have_content("Weather")
  end
end
