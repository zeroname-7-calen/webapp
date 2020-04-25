class ArticlesController < ApplicationController
  # before_action :loign_required, except: [:index, :show]

  def index
    @articles = Article.order(released_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    @article.released_at = Time.now

    if @article.save
      redirect_to @article, notice: "投稿しました"
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:article])
    @article.assing_attributes(params[:article])
    if @article.save
      redirect_to @article, notice: "投稿を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @artcile.destroy
    redirect_to :articles
  end


  private

  def article_params
    params.require(:article).permit(
      :title,
      :content
    )
  end
end
