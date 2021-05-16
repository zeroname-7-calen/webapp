class ArticlesController < ApplicationController

  def index
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    @articles = Article.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(Article.where("start_at <= ?", Time.now).where(finish_at: nil)).or(Article.where(start_at: nil)).order(released_at: :desc).page(params[:page]).per(10)
  end

  # 管理者向け記事一覧表示
  def management
    @articles = Article.with_rich_text_content.order(released_at: :desc).page(params[:page]).per(10)
    authorize!
  end

  def show
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    if current_user && loyalty(@artcile, :articles).index?
      @article = Article.with_rich_text_content.find(params[:id])
    else
      @article = Article.where("start_at <= ?", Time.now).where("finish_at >= ?", Time.now).or(Article.where("start_at <= ?", Time.now).where(finish_at: nil)).or(Article.where(start_at: nil)).find(params[:id])
    end
  end

  # 検索
  def search
    @articles = Article.search(params[:q]).page(params[:page]).per(10)
    render "index"
  end

  def new
    @article = Article.new
    authorize!
  end

  def edit
    puts "111111111111111"
    puts params[:id]
    puts "333333333333333"
    @article = Article.find(params[:id])
    authorize!
  end

  def create
    authorize!
    @article_start_at = article_params[:no_start_at]
    @article_finish_at = article_params[:no_finish_at]
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.released_at = Time.now
    if @article_start_at == "1" && @article_finish_at == "0"#開始指定アリ&終了指定ナシ
      @article.finish_at = nil#終了指定日時は入らない
      if @article.save
        redirect_to root_path, notice: "掲載開始を指定&掲載終了指定なしで投稿しました"
      else
        render "new"
      end
    elsif @article_start_at == "0" && @article_finish_at == "0"#開始・終了ともに指定なし
      @article.start_at = nil
      @article.finish_at = nil
      if @article.save
        redirect_to root_path, notice: "日付指定なしで記事を投稿しました"
      else
        render "new"
      end
    else
      if @article.save
        redirect_to root_path, notice: "日時を指定して記事を投稿しました"
      else
        render "new"
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    @article_start_at = article_params[:no_start_at]
    @article_finish_at = article_params[:no_finish_at]
    authorize!
    @article.assign_attributes(article_params)
    if @article_start_at == "0" && @article_finish_at == "0"
      @article.start_at = nil
      @article.finish_at = nil
      if @article.save
        redirect_to root_path, notice: "日時を指定せずに記事を更新しました"
      else
        render "edit"
      end
    elsif @article_start_at == "1" && @article_finish_at == "0"
      @article.finish_at = nil
      if @article.save
        redirect_to root_path, notice: "掲載開始を指定&掲載終了指定なしで更新しました"
      else
        render "edit"
      end
    else
      if @article.save
        redirect_to root_path, notice: "掲載開始・終了ともに日時指定して記事を更新しました"
      else
        render "edit"
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize!
    @article.destroy
    redirect_to :articles
  end

  private

    def article_params
      params.require(:article).permit(
        :title,
        :content,
        :start_at,
        :no_start_at,
        :finish_at,
        :no_finish_at
      )
    end
end
