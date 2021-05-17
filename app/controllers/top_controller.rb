class TopController < ApplicationController
  def index
    @articles = Article.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(Article.where("start_at <= ?", Time.now).where(finish_at: nil)).or(Article.where(start_at: nil)).order(released_at: :desc).limit(5)

    # @cover_stories = CoverStory.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(CoverStory.where("start_at <= ?", Time.now).where(finish_at: nil)).or(CoverStory.where(start_at: nil)).order(created_at: :desc).limit(1)

    @top_contents = TopContent.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(TopContent.where("start_at <= ?", Time.now).where(finish_at: nil)).or(TopContent.where(start_at: nil)).order(created_at: :desc).limit(1)

    render layout: "top_index"
  end

  def about
  end

  def bad_request
    raise ActionController::ParameterMissing, ""
  end

  def forbidden
    raise Forbidden, ""
  end

  def internal_server_error
    raise
  end

end
