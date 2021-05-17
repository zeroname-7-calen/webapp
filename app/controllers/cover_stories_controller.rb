class CoverStoriesController < ApplicationController
  def index
    @cover_stories = CoverStory.with_rich_text_content.order(created_at: :desc)
    authorize!
  end

  def show
    @cover_story = CoverStory.find(params[:id])
  end

  def new
    @cover_story = CoverStory.new
    authorize!
  end

  def edit
    @cover_story = CoverStory.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @cover_story = CoverStory.new(cover_story_params)
    @cover_story.author = current_user
    @cover_story.created_at = Time.now
     if @cover_story.save
      redirect_to root_path, notice: "トップページに掲載しました"
    else
      render "new"
    end
  end

  def update
    @cover_story = CoverStory.find(params[:id])
    authorize!
    @cover_story.assign_attributes(cover_story_params)
    if @cover_story.save
      redirect_to root_path, notice: "カバーストーリーを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @cover_story = CoverStory.find(params[:id])
    authorize!
    @cover_story.destroy
    redirect_to :cover_stories, notice: "削除しました"
  end

  private

    def cover_story_params
    params.require(:cover_story).permit(
      :title,
      :content,
      :start_at,
      :no_start_at,
      :finish_at,
      :no_finish_at
    )
    end
end
