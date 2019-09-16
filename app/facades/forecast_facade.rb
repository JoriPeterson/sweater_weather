class ForecastFacade

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def weather_info
    Forecast.new(services.get_weather_details)
  end

  private

  def services
  @_services ||= DarkskyService.new(@lat, @lng)
  end
end
