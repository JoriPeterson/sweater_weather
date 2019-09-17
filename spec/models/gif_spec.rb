require 'rails_helper'

describe Gif do
  it "exists" do
    url = "wwww.example.com",
    day = "Wednesday",
    summary = "Sunny"

    gif = Gif.new(url, day, summary)

    expect(gif).to be_a Gif
    expect(gif.day).to eq("Wednesday")
  end
end
