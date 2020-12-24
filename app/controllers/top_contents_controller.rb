class TopContentsController < ApplicationController

  def show
    @top_content = TopContent.find(params[:id])
  end
  
  def new
  end

  def edit
  end
end
