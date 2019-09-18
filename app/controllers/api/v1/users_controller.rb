class Api::V1::UsersController < ApplicationController

  def create
    respond_to :json
    user = User.new(user_params)
    user.api_key = User.api_key
    if user.save
      render json: ApiSerializer.new(user.api_key), status: 201
    else
      render json: { error: "An error occured" }, status: 400
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
