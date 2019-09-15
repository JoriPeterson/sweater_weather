require 'rails_helper'

describe DarkskyService do
	before :each do
		@darksky_service = DarkskyService.new(ENV['DARKSKY_API_KEY'])
	end

  it "exists" do
		expect(@darksky_service).to be_a(DarkskyService)
  end

  # describe "instance methods" do
  #   it "returns repositories", :vcr do
  #     search = @darksky_service.repository_data
  #     expect(search).to be_a Array
  #     expect(search.count).to eq 30
  #     expect(search[0]).to be_an Hash
  #     member_data = search[0]
  #
  #     expect(member_data).to have_key :name
  #   end
  # end
end
