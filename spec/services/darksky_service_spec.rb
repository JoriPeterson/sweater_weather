require 'rails_helper'

describe DarkskyService do
	before :each do
		@darksky_service = DarkskyService.new(ENV['DARKSKY_API_KEY'])
	end

  it "exists" do
		expect(@darksky_service).to be_a(DarkskyService)
  end
end
