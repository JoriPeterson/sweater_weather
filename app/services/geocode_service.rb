class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_location_details
    get_json("/maps/api/geocode/json?")
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com') do |f|
      f.params['address'] = "#{@location}"
      f.params['key'] = ENV["GEOCODE_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
