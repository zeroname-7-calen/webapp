class TopContentsController < ApplicationController

  def index
    authorize!
    @top_contents = TopContent.order(created_at: :desc)
  end

  def show
    authorize!
  end

  def new
    @top_content = TopContent.new
    authorize!
  end

  def edit
    @top_content = TopContent.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @top_content_start_date = top_content_params[:no_start_date]
    @top_content_finish_date = top_content_params[:no_finish_date]
    @top_content = TopContent.new(top_content_params)
    if @top_content_start_date == "0"
      @top_content.start_date = nil
      @top_content.finish_date = nil
      if @top_content.save
        redirect_to root_path, notice: "日付指定なしでトップ写真／動画をアップしました"
      else
        render "new"
      end
    else
      if @top_content.save
          redirect_to root_path, notice: "日時を指定してトップ写真／動画をアップしました"
      else
        render "new"
      end
    end
  end

  def update
    @top_content = TopContent.find(params[:id])
    @top_content_start_date = top_content_params[:no_start_date]
    @top_content_finish_date = top_content_params[:no_finish_date]
    authorize!
    @top_content.assign_attributes(top_content_params)
    if @top_content_start_date == "0"
      @top_content.start_date = nil
      @top_content.finish_date = nil
      if @top_content.save
        redirect_to root_path, notice: "日時を指定せずにトップ写真／動画を更新しました"
      else
         render "edit"
      end
    else
      if @top_content.save
        redirect_to root_path, notice: "日時を指定してトップ写真／動画を更新しました"
      else
        render "edit"
      end
    end
  end
  def destroy
    @top_content = TopContent.find(params[:id])
    authorize!
    @top_content.destroy
    redirect_to root_path, notice: "削除しました"
  end

    private

    def top_content_params
      params.require(:top_content).permit(
        :title,
        :url,
        :caption,
        :start_date,
        :no_start_date,
        :finish_date,
        :no_finish_date
      )
    end
end
