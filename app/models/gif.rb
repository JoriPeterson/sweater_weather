class Gif
  attr_reader :id, :url

  def initialize(info, weather_info)
    @id = 1
    @url = info[:url]
    # binding.pry
  end
end
