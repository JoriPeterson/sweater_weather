require 'rails_helper'

describe "User Login API" do
  it "logs in a user" do
    user = User.create!(email: "whatever@example.com", password: "password", api_key: "d450965fb2f168d4ddc607")

    post "/api/v1/sessions", params: { "email" => "whatever@example.com", "password" => "password" }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    user_1 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(user_1[:api_key]).to eq(user.api_key)
    expect(user_1[:api_key].length).to eq(22)
  end

  it "sends an error if incorrect info" do

    post "/api/v1/sessions", params: {"password" => "password"}.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to eq({:error=>"An error occured"})
  end
end
