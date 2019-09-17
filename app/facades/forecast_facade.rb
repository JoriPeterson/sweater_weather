class ForecastFacade

  def initialize(location)
    @location = location
    @lat = address_components.lat
    @lng = address_components.lng
  end

  def address_components
    Location.new(geocode_services.get_location_details[:results])
  end

  def weather_info
    Forecast.new(darksky_services.get_weather_details, address_components)
  end

  private

  def geocode_services
    @_geocode_services ||= GeocodeService.new(@location)
  end

  def darksky_services
    @_dark_skyservices ||= DarkskyService.new(@lat, @lng)
  end
end
