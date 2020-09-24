class EventguidesController < ApplicationController
  def index
    @eventguides = Eventguide.order(created_at: :desc)
  end

  def show
    @eventguide = Eventguide.find(params[:id])
  end

  def new
    @eventguide = Eventguide.new
  end

  def edit
    @eventguide = Eventguide.find(params[:id])
  end

  def create
   @eventguide = Eventguide.new(eventguide_params)
   @eventguide.author = current_user
   @eventguide.created_at = Time.now
     if @eventguide.save
       redirect_to :eventguides, notice: "イベントガイド情報をアップしました"
     else
       render "new"
     end
  end

  def update
    # @eventguide = current_user.eventguides.find(params[:id])
    @eventguide = Eventguide.find(params[:id])
    @eventguide.assign_attributes(eventguide_params)
      if @eventguide.save
        redirect_to :eventguides, notice: "イベントガイド情報を更新しました"
      else
        render "edit"
      end
  end

  def destroy
    @eventguide = Eventguide.find(params[:id])
    @eventguide.destroy
    redirect_to :eventguides, notice: "削除しました"
  end

     private

       def eventguide_params
         params.require(:eventguide).permit(
           :title,
           :content,
           :is_display
         )
       end
end
