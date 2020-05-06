class MicropostsController < ApplicationController
  # before_action :login_required, except: [:index, :show]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @microposts = @user.microposts.page(params[:page]).per(10)
    else
      @microposts = Micropost.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def edit
    @micropost = current_user.microposts.find(params[:id])
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.author = current_user
    @micropost.created_at = Time.now
    if @micropost.save!
      redirect_to @micropost, notice: "ツイートしました"
    else
      render "new"
    end
  end

  def update
    @micropost = current_user.microposts.find(params[:id])
    @micropost.assign_attributes(params[:micropost])
    if @micropost.save
      redirect_to @micropost, notice: "ツイートを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy
    redirect_to :microposts, notice: "ツイートを削除しました"
  end
end
