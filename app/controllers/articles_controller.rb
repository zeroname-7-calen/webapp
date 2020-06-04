class ArticlesController < ApplicationController

  def index
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    @articles = Article.order(released_at: :desc).page(params[:page]).per(10)
  end

  def show
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    @article = Article.find(params[:id])
  end

  # 検索
  def search
    @articles = Article.search(params[:q]).page(params[:page]).per(10)
    render "index"
  end

  def new
    @article = Article.new
    authorize! @article
  end

  def edit
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    # @article = current_user.articles.find(params[:id])
    @article = Article.find(params[:id])
    authorize! @article
  end

  def create
    authorize! @article

    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.released_at = Time.now
    if @article.save
      redirect_to @article, notice: "投稿しました"
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    authorize! @article
    @article.assign_attributes(article_params)
    if @article.save!
      redirect_to @article, notice: "投稿を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize! @article
    @article.destroy
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
