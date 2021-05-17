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
    @cover_story_start_at = cover_story_params[:no_start_at]
    @cover_story_finish_at = cover_story_params[:no_finish_at]
    @cover_story = CoverStory.new(cover_story_params)
    @cover_story.author = current_user
    @cover_story.created_at = Time.now
    if @cover_story_start_at == "1" && @cover_story_finish_at == "0"#開始指定アリ&終了指定ナシ
      @cover_story.finish_at = nil#終了指定日時は入らない
      if @cover_story.save
        redirect_to root_path, notice: "掲載開始を指定&掲載終了指定なしで投稿しました"
      else
        render "new"
      end
    elsif @cover_story_start_at == "0" && @cover_story_finish_at == "0"#開始・終了ともに指定なし
      @cover_story.start_at = nil
      @cover_story.finish_at = nil
      if @cover_story.save
        redirect_to root_path, notice: "日付指定なしで記事を投稿しました"
      else
        render "new"
      end
    else
      if @cover_story.save
        redirect_to root_path, notice: "日時を指定して記事を投稿しました"
      else
        render "new"
      end
    end
  end

  def update
    @cover_story = CoverStory.find(params[:id])
    @cover_story_start_at = cover_story_params[:no_start_at]
    @cover_story_finish_at = cover_story_params[:no_finish_at]
    authorize!
    @cover_story.assign_attributes(cover_story_params)
    if @cover_story_start_at == "0" && @cover_story_finish_at == "0"
      @cover_story.start_at = nil
      @cover_story.finish_at = nil
      if @cover_story.save
        redirect_to root_path, notice: "日時を指定せずに記事を更新しました"
      else
        render "edit"
      end
    elsif @cover_story_start_at == "1" && @cover_story_finish_at == "0"
      @cover_story.finish_at = nil
      if @cover_story.save
        redirect_to root_path, notice: "掲載開始を指定&掲載終了指定なしで更新しました"
      else
        render "edit"
      end
    else
      if @cover_story.save
        redirect_to root_path, notice: "掲載開始・終了ともに日時指定して記事を更新しました"
      else
        render "edit"
      end
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
