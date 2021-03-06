class FishinginfosController < ApplicationController

  def index
    @fishinginfos = Fishinginfo.order(created_at: :desc)
  end

  def show
    @fishinginfo = Fishinginfo.find(params[:id])
  end

  def new
    @fishinginfo = Fishinginfo.new
    authorize!
  end

  def edit
    @fishinginfo = Fishinginfo.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @fishinginfo = Fishinginfo.new(fishinginfo_params)
    @fishinginfo.author = current_user
    @fishinginfo.created_at = Time.now
      if @fishinginfo.save
        redirect_to @fishinginfo, notice: "アップしました"
      else
        render "new"
      end
  end

  def update
    @fishinginfo = Fishinginfo.find(params[:id])
    authorize!
    @fishinginfo.assign_attributes(fishinginfo_params)
    if @fishinginfo.save
      redirect_to @fishinginfo, notice: "釣り情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @fishinginfo = Fishinginfo.find(params[:id])
    authorize!
    @fishinginfo.destroy
    redirect_to :fishinginfos, notice: "削除しました"
  end

     private

      def fishinginfo_params
      params.require(:fishinginfo).permit(
        :title,
        :content
      )
      end
end
