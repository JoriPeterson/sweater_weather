class Location
  attr_reader :id, :city, :state, :country, :lat, :lng

  def initialize(info)
    @id = 1
    @city = info.first[:address_components][0][:long_name]
    @state = info.first[:address_components][2][:short_name]
    @country = info.first[:address_components][3][:long_name]
    @lat = info.first[:geometry][:location][:lat].round(4)
    @lng = info.first[:geometry][:location][:lng].round(4)
  end
end
