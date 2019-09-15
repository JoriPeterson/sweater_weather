class Api::V1::WeatherController < ApplicationController

  def show
    render locals: {location: LocationFacade.new(params[:location])}
    render locals: {forecast: ForecastFacade.new(params[:lat], params[:lng])}
  end
end
