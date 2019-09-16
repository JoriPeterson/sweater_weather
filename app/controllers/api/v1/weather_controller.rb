class Api::V1::WeatherController < ApplicationController

  def show
    location_facade = LocationFacade.new(params[:location])
    lat = location_facade.address_components.first.lat
    lng = location_facade.address_components.first.lng

    forecast_facade = ForecastFacade.new(lat, lng)
    render json: ForecastSerializer.new(forecast_facade.weather_info)
  end
end
