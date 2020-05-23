class ArticlesLoyalty < ApplicationLoyalty

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin? || user.id == record.user_id
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
