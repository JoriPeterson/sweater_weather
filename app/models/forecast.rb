class Forecast
  attr_reader :id, :date_and_time, :current_summary, :current_icon, :current_temp, :feels_like, :humidity, :uv_index, :visibility, :todays_summary, :daily_icon, :high_temp, :low_temp, :hourly, :daily

  def initialize(info)
    @id = 1
    @date_and_time = Time.at(info[:currently][:time]).strftime("%-I:%M %p, %-m/%-d")
    @current_summary = info[:currently][:summary]
    @current_icon = info[:currently][:icon]
    @current_temp = info[:currently][:temperature].to_i
    @feels_like = info[:currently][:apparentTemperature].to_i
    @humidity = info[:currently][:humidity]
    @uv_index = info[:currently][:uvIndex]
    @visibility = info[:currently][:visibility].round(2)
    @todays_summary = info[:daily][:summary]
    @daily_icon = info[:daily][:icon]
    @high_temp = info[:daily][:data][0][:temperatureHigh].to_i
    @low_temp = info[:daily][:data][0][:temperatureLow].to_i
    @hourly = format_hourly(info)
    @daily = format_daily(info)
  end

  def format_hourly(info)
    info[:hourly][:data].map do |hour|
      { time: Time.at(hour[:time]).strftime("%-I %p"),
        icon: hour[:icon],
        temp: hour[:temperature].to_i }
    end
  end

  def format_daily(info)
    info[:daily][:data].map do |day|
      { date: Time.at(day[:time]).strftime("%A"),
        icon: day[:icon],
        precip: day[:precipProbability],
        daily_high: day[:temperatureHigh],
        daily_low: day[:temperatureLow] }
    end
  end
end
