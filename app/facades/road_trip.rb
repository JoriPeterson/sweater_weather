class RoadTrip

  def initialize(orgin, destination)
    @orgin = orgin
    @destination = destination
    @duration = trip_details.duration
    @destination_lat = trip_details.destination_lat.round(4)
    @destination_lng = trip_details.destination_lng.round(4)
    @future_time = find_future_time
  end

  def find_future_time
    if @duration.scan(/\d+/).length > 1
      time = @duration.scan(/\d+/).join(".").to_f
    else
      time = @duration.scan(/\d+/).first.to_f
    end
    ((time * 3600) + Time.now.to_i).to_i
  end

  def future_forecast
    TripForecast.new(darksky_services.get_future_forecast[:currently], @duration)
  end

  def trip_details
    Trip.new(directions_services.get_trip_details[:routes][0][:legs])
  end

  private

  def directions_services
    @_directions_services ||= DirectionsService.new(@origin, @destination)
  end

  def darksky_services
    @_darksky_services ||= DarkskyTimeMachineService.new(@destination_lat, @destination_lng, @future_time)
  end
end
