class Api::V1::RoadTripController < ApplicationController

  def create
    if current_user.api_key == params[:api_key]
      respond_to :json
      road_trip = RoadTrip.new(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip.future_forecast)
    else
      render file: "/public/401", status: 401
    end
  end
end
