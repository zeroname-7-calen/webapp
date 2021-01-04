class TopContentsController < ApplicationController

  def new
    @top_content = TopContent.new
  end

  def edit
    @top_content = TopContent.find(params[:id])
  end

  def create
    @top_content = TopContent.new(top_content_params)
    @top_content.created_at = Time.now
    if @top_content.save
      redirect_to root_path, notice: "トップ写真／動画をアップしました"
    end
  end

  def update
    @top_content = TopContent.find(params[:id])
    @top_content.assign_attributes(top_content_params)
    if @top_content.save
      redirect_to root_path, notice: "トップ写真／動画を更新しました"
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
        :finish_date
      )
    end
end
