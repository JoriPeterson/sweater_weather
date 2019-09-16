class Api::V1::BackgroundsController < ApplicationController

  def show
    background_facade = BackgroundFacade.new(params[:location])
    render json: { image: background_facade.backgrounds }
  end
end
