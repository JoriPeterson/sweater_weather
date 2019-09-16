class Api::V1::WeatherController < ApplicationController

  def show
    facade = LocationFacade.new(params[:location])
    render json: LocationSerializer.new(facade.address_components)

    ForecastFacade.new(params[:lat], params[:lng])
  end
end
