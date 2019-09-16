require 'rails_helper'

describe Gif do
  it "exists" do
    attrs = {
      day: "Wednesday",
    }

    gif = Gif.new(attrs)

    expect(gif).to be_a Gif
    expect(gif.day).to eq("Wednesday")
  end
end
