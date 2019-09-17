require 'rails_helper'

describe "User Login API" do
  it "creates a new user" do

    post "/api/v1/users", params: { "email" => "whatever@example.com", "password" => "password", "password_confirmation" => "password" }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(user[:api_key].class).to eq(String)
    expect(user[:api_key].length).to eq(22)
  end
end
