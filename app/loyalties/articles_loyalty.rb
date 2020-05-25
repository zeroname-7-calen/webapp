class ArticlesLoyalty < ApplicationLoyalty

  def new?
    puts "------------------"
    puts user
    puts record
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    puts "@" * 30
    puts user
    puts record
    # puts record(pramas[:id])
    # puts article(pramas[:id])
    # puts params(:id)
    puts params[:id]
    # puts record.find(params[:id])
    # puts @article.find(params[:id])
    # puts record(params)

    user.admin? || user.id == record.user_id?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
