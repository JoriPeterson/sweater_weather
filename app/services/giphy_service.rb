class GiphyService

  def initialize(summary)
    @summary = summary
  end

  def get_gifs
    get_json("/v1/gifs/search?")
  end

  private

  def conn
    Faraday.new('https://api.giphy.com') do |f|
      f.params['api_key'] = ENV["GIPHY_API_KEY"]
      f.params['q'] = "#{summary}"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
