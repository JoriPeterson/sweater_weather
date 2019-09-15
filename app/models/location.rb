class Location
  attr_reader :city, :state, :country

  def initialize(components)
  binding.pry
    @city = components[:long_name]
    @state = components[:short_name]
    @country = components[:long_name]
  end
end
