require 'rails_helper'

describe GeocodeService do
	before :each do
		@geocode_service = GeocodeService.new("Denver", "CO")
	end

  it "exists" do
		expect(@geocode_service).to be_a(GeocodeService)
  end

  describe "instance methods" do
    it "returns address", :vcr do
      search = @geocode_service.get_location_details[:results]
      expect(search).to be_a Array
      expect(search[0]).to be_an Hash
      # location = search[0]
      #
      # expect(location).to have_key :lat
      # expect(location).to have_key :lng
    end
  end
end
