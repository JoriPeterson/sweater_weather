class GifFacade

  def initialize(weather_info)
    @weather_info = weather_info
    @daily_summary = weather_info.daily.map { |day| day[:summary] }
  end

  def gifs
    giphy_response = @daily_summary.each do |summary|
      GiphyService.new(summary)
    end
    binding.pry
    giphy_response
  end

  private

  # def giphy_services
  #   GiphyService.new(@daily_summary)
  #   # @_giphy_services ||= GiphyService.new(@daily_summary)
  # end
end
