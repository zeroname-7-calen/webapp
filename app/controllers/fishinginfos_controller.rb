class FishinginfosController < ApplicationController
   # before_action :login_required, except: [:index, :show]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @fishinginfos = @user.fishinginfos.order(created_at: :desc)
    else
      @fishinginfos = Fishinginfo.order(created_at: :desc)
    end
  end

  def show
    @fishinginfo = Fishinginfo.find(params[:id])
  end

  def new
  end

  def edit
  end
end
