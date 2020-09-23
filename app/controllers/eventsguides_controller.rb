class EventsguidesController < ApplicationController

  def index
    @eventsguides = Eventsguide.order(created_at: :desc)
  end

  def show
    @eventsguide = Eventsguide.find(params[:id])
  end

  def new
    @eventsguide = Eventsguide.new
  end

  def edit
    @eventsguide = Eventsguide.find(params[:id])
  end

  def create
    @eventsguide = Eventsguide.new(eventsguide_params)
    @eventsguide.author = current_user
    @eventsguide.created_at = Time.now
    if @eventsguide.save!
      redirect_to @eventsguide, notice: "イベントガイド情報をアップしました"
    else
     render "new"
    end
  end

  def update
    @eventsguide = Eventsguide.find(params[:id])
    @eventsguide.assign_attributes(eventsguide_params)
    if @eventsguide.save
      redirect_to @eventsguide, notice: "イベントガイド情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @eventsguide = Eventsguide.find(params[:id])
    @eventsguide.destroy
    redirect_to :eventsguides, notice: "削除しました"
  end

     private

   def eventsguide_params
     params.require(:eventsguide).permit(
       :title,
       :content,
       :is_display
     )
   end
end
