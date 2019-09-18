class Api::V1::RoadTripController < ApplicationController

  def create
    key = params[:api_key]
    user = User.where("users.api_key = ?", key)
    if !user.empty?
      respond_to :json
      road_trip = RoadTrip.new(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip.future_forecast)
    else
      render json: { error: "An error occured" }, status: 401
    end
  end
end
