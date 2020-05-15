class MessagesController < ApplicationController
  # before_action :login_required, except: [:index, :show]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @messages = @user.messages.order(created_at: :desc).page(params[:page]).per(10)
    else
      @messages = Message.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.author = current_user
    @message.created_at = Time.now
    if @message.save!
      redirect_to @message, notice: "ツイートしました"
    else
      render "new"
    end
  end

  def update
    # @message = current_user.messages.find(params[:id])
    @message = Message.find(params[:id])
    @message.assign_attributes(message_params)
    if @message.save
      redirect_to @message, notice: "ツイートを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to :messages, notice: "削除しました"
  end


    private

    def message_params
      params.require(:message).permit(
        :title,
        :content,
        :picture
      )
    end
end
