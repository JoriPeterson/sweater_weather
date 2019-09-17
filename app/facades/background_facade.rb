class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def backgrounds
     services.get_background[0][:urls][:full]
  end

  private

  def services
    @_services ||= UnsplashService.new(@location)
  end
end
