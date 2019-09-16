require 'rails_helper'

describe Location do
  it "exists" do
    attrs = {
      city: "Denver",
    }

    location = Location.new(attrs)

    expect(location).to be_a Location
    expect(location.city).to eq("Denver")
  end
end
