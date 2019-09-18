class DirectionsService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_trip_details
    get_json("/maps/api/directions/json?")
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com') do |f|
      f.params['origin'] = "#{@origin}"
      f.params['destination'] = "#{@destination}"
      f.params['key'] = ENV["GEOCODE_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
