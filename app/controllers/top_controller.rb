class TopController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc).limit(5)
    if @top_content_start_date == "0"
      @top_contents = TopContent.where("start_date <= ?", Time.now).where("finish_date >= ?", Time.now)
    else
      @top_contents = TopContent.all
    end

      # @top_contents = TopContent.all
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
