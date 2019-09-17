class Api::V1::GifsController < ApplicationController

  def show
    forecast_facade = ForecastFacade.new(params[:location])
    gif_facade = GifFacade.new(forecast_facade.weather_info)
    render json: GifSerializer.new(gif_facade.create_objects.flatten)
  end
end
