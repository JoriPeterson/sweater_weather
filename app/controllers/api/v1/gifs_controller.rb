class Api::V1::GifsController < ApplicationController

  def show
    location_facade = LocationFacade.new(params[:location])
    lat = location_facade.address_components.lat
    lng = location_facade.address_components.lng
    forecast_facade = ForecastFacade.new(lat, lng)

    gif_facade = GifFacade.new(forecast_facade.weather_info)
    # binding.pry
    render json: GifSerializer.new(gif_facade.create_objects.flatten)
  end
end
