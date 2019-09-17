class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      render json: ApiSerializer.new(user.api_key)
    else
      flash[:error] = "Looks like your email or password is invalid"
    end
  end
end
