class ArticlesLoyalty < ApplicationLoyalty

  def new?
    user.admin? || user == record.user
  end

  def edit?
    user.admin? || user == record.user
  end
end
