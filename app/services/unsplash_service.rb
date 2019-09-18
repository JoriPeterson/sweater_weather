class UnsplashService

  def initialize(location)
    @location = location
  end

  def get_background
    get_json("/search/photos?")
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV["UNSPLASH_API_KEY"]
      f.params['query'] = "#{@location}+skyline"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
