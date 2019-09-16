class GifFacade

  def initialize(weather_info)
    @weather_info = weather_info
    @daily_summary = weather_info.daily.map { |day| day[:summary] }
  end

  def gifs
    @daily_summary.each do |summary|
      GiphyService.new(summary).get_gifs
    end
  end

  def create_objects
    binding.pry
    gifs[0][:data].map do |info|
      Gif.new(info, @weather_info)
    end
  end
end
