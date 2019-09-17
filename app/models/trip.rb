class Trip
  attr_reader :duration, :destination_lat, :destination_lng

  def initialize(info)
    @duration = info[0][:duration][:text]
    @destination_lat = info[0][:end_location][:lat]
    @destination_lng = info[0][:end_location][:lng]
  end
end
