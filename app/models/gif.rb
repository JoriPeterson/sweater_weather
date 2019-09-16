class Gif
  attr_reader :id, :url

  def initialize(info, weather_info)
    @id = 1
    @day = weather_info.daily[:date]
    @url = info[:url]
    binding.pry
  end
end
