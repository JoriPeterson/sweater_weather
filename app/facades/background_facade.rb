class BackgroundFacade

  def initialize(location)
    @formatted_location = location.split(",")
    @city = @formatted_location.first
    @state = @formatted_location.last.lstrip
  end

  def backgrounds
     services.get_background[0][:urls][:full]
  end

  private

  def services
  @_services ||= UnsplashService.new(@city, @state)
  end
end
