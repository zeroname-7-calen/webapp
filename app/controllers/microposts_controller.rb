class MicropostsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(10)
    else
      @microposts = Micropost.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
    authorize! @micropost
  end

  def edit
    @micropost = current_user.microposts.find(params[:id])
    # @micropost = Micropost.find(params[:id])
    authorize! @micropost
  end

  def create
    authorize! @micropost
    @micropost = Micropost.new(micropost_params)
    @micropost.author = current_user
    @micropost.created_at = Time.now
    if @micropost.save
      redirect_to @micropost, notice: "ツイートしました"
    else
      render "new"
    end
  end

  def update
    @micropost = current_user.microposts.find(params[:id])
    # @micropost = Micropost.find(params[:id])
    authorize! @micropost
    @micropost.assign_attributes(micropost_params)
    if @micropost.save
      redirect_to @micropost, notice: "ツイートを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    # @micropost = current_user.microposts.find(params[:id]) ←これでは不可
    @micropost = Micropost.find(params[:id])
    authorize! @micropost
    @micropost.destroy
    redirect_to :microposts, notice: "ツイートを削除しました"
  end

  def like
    @micropost = Micropost.find(params[:micropost_id])
    current_user.voted_microposts << @micropost
    redirect_to @micropost, notice: "投票しました。"
  end

  def unlike
    current_user.voted_microposts.destroy(Micropost.find(params[:micropost_id]))
    redirect_to :microposts, notice: "解除しました。"
  end

  def voted
    @microposts = current_user.voted_microposts
      .order("votes.created_at DESC")
      .page(params[:page]).per(15)
  end

    private
      def micropost_params
        params.require(:micropost).permit(
          :content,
          :picture,
          :created_at
        )
      end
end
