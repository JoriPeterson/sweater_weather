class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :city, :state, :country,:date_and_time, :current_summary, :current_icon, :current_temp, :feels_like, :humidity, :uv_index, :visibility, :todays_summary, :daily_icon, :high_temp, :low_temp, :hourly, :daily
end
