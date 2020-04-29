class TopController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc).limit(5)
    @fileuploads = @img_paths
  end

  def about
    # render :layout => false
  end
end
