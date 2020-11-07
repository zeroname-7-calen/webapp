class TopController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc).limit(5)
    # @fileuploads = @img_path
    # authorize! @questionnaire
    # authorize! @top
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
