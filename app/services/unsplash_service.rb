class UnsplashService

  def initialize(city, state)
    @city = city
    @state = state
  end

  def get_background
    get_json("/photos/?")
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV["UNSPLASH_API_KEY"]
      f.params['query'] = "#{@city}+#{@state}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
