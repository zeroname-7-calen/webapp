class TopController < ApplicationController
  def index
    # @articles = Article.order(released_at: :desc).limit(5)
    @articles = Article.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(Article.where(start_at: nil)).order(released_at: :desc).limit(5)

    @top_contents = TopContent.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(TopContent.where(start_at: nil)).order(created_at: :desc).limit(1)

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
