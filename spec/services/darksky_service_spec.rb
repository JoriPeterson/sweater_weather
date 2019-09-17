require 'rails_helper'

describe DarkskyService do
	before :each do
		WebMock.allow_net_connect!
		@darksky_service = DarkskyService.new("39.7392","-104.9903")
	end

  it "exists" do
		expect(@darksky_service).to be_a(DarkskyService)
  end
end
