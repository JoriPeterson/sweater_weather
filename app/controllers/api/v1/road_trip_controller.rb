class Api::V1::RoadTripController < ApplicationController

  def create
    if current_user.api_key == params[:api_key]
      respond_to :json
      trip = RoadTrip.new(params[:origin], params[:destination])
      RoadTripSerializer.new(trip.trip_details)
    else
      render file: "/public/401", status: 401
    end
  end
end
