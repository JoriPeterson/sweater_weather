require 'rails_helper'

describe Forecast do
  it "exists" do
    attrs = {
      current_temp: 75,
    }

    location = Forecast.new(attrs)

    expect(location).to be_a Forecast
    expect(location.current_temp).to eq(75)
  end
end
