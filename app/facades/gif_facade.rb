class GifFacade

  def initialize(weather_info)
    @daily_summary = weather_info.daily
  end


  def gifs
    giphy_services.get_gifs
  end

  private

  def giphy_services
    @_giphy_services ||= GiphyService.new(@daily_summary)
  end
end
