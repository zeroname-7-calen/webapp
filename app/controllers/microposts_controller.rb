class MicropostsController < ApplicationController
  before_action :login_required, except: [:index, :show]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @microposts = @user.microposts
    else
      @microposts = Micropost.all
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
  end

  def edit
  end
end
