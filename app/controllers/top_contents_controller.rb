class TopContentsController < ApplicationController

  def new
    @top_content = TopContent.new
  end

  def edit
    @top_content = TopContent.find(params[:id])
  end

  def create
    @top_content_start_date = top_content_params[:no_start_date]
    @top_content_finish_date = top_content_params[:no_finish_date]
      if @top_content_start_date == "1"# && @top_content_finish_date =="1"
        @top_content = TopContent.new(top_content_params)
        @top_content.start_date = nil
        @top_content.finish_date = nil
        @top_content.created_at = Time.now
          if @top_content.save
            redirect_to root_path, notice: "日付指定なしでトップ写真／動画をアップしました"
          end
      elsif @top_content_start_date == "0"# && @top_content_finish_date =="0"
        @top_content = TopContent.new(top_content_params)
        @top_content.created_at = Time.now
          if @top_content.save
            redirect_to root_path, notice: "日時を指定してトップ写真／動画をアップしました"
          end
      end
  end

  def update
    @top_content = TopContent.find(params[:id])
    @top_content_start_date = top_content_params[:no_start_date]
    @top_content_finish_date = top_content_params[:no_finish_date]
    if @top_content_start_date == "1" && @top_content_finish_date == "1"
      @top_content.assign_attributes(top_content_params)
      @top_content.start_date = nil
      @top_content.finish_date = nil
      if @top_content.save
        redirect_to root_path, notice: "日時を指定せずにトップ写真／動画を更新しました"
      end
    elsif @top_content_start_date == "0"
      @top_content.assign_attributes(top_content_params)
      if @top_content.save
        redirect_to root_path, notice: "日時を指定してトップ写真／動画を更新しました"
      end
    end
  end

  def destroy
    @top_content = TopContent.find(params[:id])
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
