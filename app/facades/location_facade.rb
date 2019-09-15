class LocationFacade

  def initialize(location)
    @formatted_location = location.split(",")
    @city = @formatted_location.first
    @state = @formatted_location.last.lstrip
  end

  def address_components
    binding.pry
    services.get_location_details[:results].first[:address_components].map do |components|
      Location.new(components)
    end
  end

  private

  def services
  @_services ||= GeocodeService.new(@city, @state)
  end
end
