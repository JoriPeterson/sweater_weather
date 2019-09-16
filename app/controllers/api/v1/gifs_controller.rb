class Api::V1::GifsController < ApplicationController

  def show
    location_facade = LocationFacade.new(params[:location])
    lat = location_facade.address_components.lat
    lng = location_facade.address_components.lng
    forecast_facade = ForecastFacade.new(lat, lng)

    GifFacade.new(forecast_facade.weather_info)
  end

end
