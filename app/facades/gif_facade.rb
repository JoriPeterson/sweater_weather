class GifFacade

  def initialize(weather_info)
    @days = weather_info.daily[0..4]
    @daily_summary = weather_info.daily[0..4].map { |day| day[:summary] }
  end

  def gifs
    @daily_summary.map do |summary|
      GiphyService.new(summary).get_gifs
    end
  end

  def create_objects
    gifs[0][:data].map do |info|
      @days.map do |day|
        Gif.new(info[:url], day[:date], day[:summary])
      end
    end.flatten
  end
end
