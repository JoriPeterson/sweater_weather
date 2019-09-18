class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:session][:password])
      render json: ApiSerializer.new(user.api_key), status: 201
    else
      render json: { error: "An error occured" }, status: 400
    end
  end
end
