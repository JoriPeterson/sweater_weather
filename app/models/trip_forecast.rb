class TripForecast
  attr_reader :id, :temperature, :summary, :estimated_travel_time

  def initialize(forecast, duration)
    @id = 1
    @temperature = forecast[:temperature].to_i
    @summary = forecast[:summary]
    @estimated_travel_time = duration
  end
end
