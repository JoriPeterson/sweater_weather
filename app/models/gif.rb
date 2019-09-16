class Gif
  attr_reader :id, :url, :day, :summary

  def initialize(info, date, summary)
    @id = 1
    @url = info[:url]
    @day = date
    @summary = summary
  end
end
