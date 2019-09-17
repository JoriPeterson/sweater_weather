require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'methods' do
    it "api_key" do
      expect(User.api_key.length).to eq(22)
    end
  end
end
