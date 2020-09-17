class MicropostsLoyalty < ApplicationLoyalty
  def index?
    user.admin?
  end

  def new?
    user.admin? || user.visitor?
  end

  def create?
    user.admin? || user.visitor?
  end

  def edit?
    user.admin? || user.visitor?
  end

  def update?
    user.admin? || user.visitor?
  end

  def destroy?
    user.admin? || user.visitor?
  end
end
