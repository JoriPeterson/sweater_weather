class Location
  attr_reader :id, :city, :state, :country, :lat, :lng

  def initialize(info)
    @id = 1
    @city = info.first.last[0][:long_name]
    @state = info.first.last[2][:short_name]
    @country = info.first.last[3][:long_name]
    @lat = info[:geometry][:location][:lat].round(4)
    @lng = info[:geometry][:location][:lng].round(4)
  end
end
