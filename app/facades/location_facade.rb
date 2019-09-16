class LocationFacade
  attr_reader :address_components

  def initialize(location)
    @formatted_location = location.split(",")
    @city = @formatted_location.first
    @state = @formatted_location.last.lstrip
  end

  def address_components
    Location.new(services.get_location_details[:results])
  end

  private

  def services
  @_services ||= GeocodeService.new(@city, @state)
  end
end
