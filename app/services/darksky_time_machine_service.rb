class DarkskyTimeMachineService

  def initialize(destination_lat, destination_lng, future_time )
    @lat = destination_lat
    @lng = destination_lng
    @time = future_time
  end

  def get_future_forecast
    get_json("/forecast/#{ENV["DARKSKY_API_KEY"]}/#{@lat},#{@lng},#{@time}")
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
