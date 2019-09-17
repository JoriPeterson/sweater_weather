class RoadTrip

  def initialize(orgin, destination)
    @orgin = orgin
    @destination = destination
    @duration = trip_details.duration
    @destination_lat = trip_details.destination_lat
    @destination_lng = trip_details.destination_lng
  end

  def trip_details
    Trip.new(directions_services.get_trip_details[:routes][0][:legs])
  end

  private

  def directions_services
    @_directions_services ||= DirectionsService.new(@origin, @destination)
  end
end
