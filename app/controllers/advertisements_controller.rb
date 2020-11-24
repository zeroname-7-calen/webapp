class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.order(created_at: :desc)
    authorize! @advertise
  end

  def new
    @advertisement = Advertisement.new
    authorize! @advertise
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
    authorize! @advertise
  end

  def create
    authorize! @advertise
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.created_at = Time.now
    if @advertisement.save
      redirect_to root_path, notice: "広告データをアップしました"
    else
      render "new"
    end
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    authorize! @advertise
    @advertisement.assign_attributes(advertisement_params)
    if @advertisement.save
      redirect_to root_path, notice: "広告データを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    authorize! @advertise
    @advertisement.destroy
    redirect_to root_path, notice: "削除しました"
  end

    private

    def advertisement_params
      params.require(:advertisement).permit(
        :title,
        :picture,
        :image_url
      )
    end
end
