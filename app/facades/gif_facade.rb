class GifFacade

  def initialize(weather_info)
    @weather_info = weather_info
    @daily_summary = weather_info.daily.map { |day| day[:summary] }
  end

  def gifs
    @daily_summary.map do |summary|
      GiphyService.new(summary).get_gifs
    end
  end

end
