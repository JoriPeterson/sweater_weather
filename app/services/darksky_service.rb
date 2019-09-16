class DarkskyService

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def get_weather_details
    get_json("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{@lat},#{@lng}")
  end

  private

  def conn
    Faraday.new('https://api.darksky.net') do |f|
      f.params['exclude'] = "minutely"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
