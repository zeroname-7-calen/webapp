class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.order(created_at: :desc)
    # @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
  end

  def edit
  end
end
