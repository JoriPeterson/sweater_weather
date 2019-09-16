class GifFacade

  def initialize(weather_info)
    binding.pry
    @weather_info = weather_info.daily
    daily_summary = weather_info.daily.map
  end

  def daily_summary
    #array of daily summaries
    @weather_info.map do |day|
      day[:icon]
    end
  end

  def gif_for_summary
    services.get_gifs
  end

  private

  def giphy_services
    @_giphy_services ||= GiphyService.new(daily_summary)
  end
end
