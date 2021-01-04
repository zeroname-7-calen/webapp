class TopController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc).limit(5)
    top_content_ids = TopContent.where.not(start_date: nil).pluck(:id)
    @top_contents = TopContent.where(id: top_content_ids).where("start_date <= ?", Time.now).where("finish_date >= ?", Time.now)
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
