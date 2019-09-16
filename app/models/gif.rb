class Gif
  attr_reader :url, :day, :summary

  def initialize(info, date, summary)
    @url = info[:url]
    @day = date
    @summary = summary
  end
end
