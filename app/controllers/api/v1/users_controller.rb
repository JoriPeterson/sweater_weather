class Api::V1::UsersController < ApplicationController

  def create
    respond_to :json
    user = User.create(
      email: params[:email],
      password_digest: params[:password],
      api_key: User.api_key
      )
    render json: ApiSerializer.new(user.api_key)
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
