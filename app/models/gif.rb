class Gif
  attr_reader :url, :day, :summary

  def initialize(url, date, summary)
    @url = url
    @day = date
    @summary = summary
  end
end
