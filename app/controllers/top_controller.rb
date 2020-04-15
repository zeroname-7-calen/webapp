class TopController < ApplicationController
  def index
  end

  def about
    render :layout => false
  end
end
