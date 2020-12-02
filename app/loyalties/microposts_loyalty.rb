class MicropostsLoyalty < ApplicationLoyalty
  def index?
    user.admin?
  end

  def new?
    user && user.admin? || user && user.visitor? || user && user.candidate? || user && user.advertise?
  end

  def create?
    user && user.admin? || user && user.visitor? || user && user.candidate? || user && user.advertise?
  end

  def edit?
    user && user.advertise? || user.id == record.user_id

  end

  def update?
    user && user.admin? || user && user.visitor? || user && user.candidate? || user && user.advertise?

  end

  def destroy?
    user && user.admin? || user && user.visitor? || user && user.candidate? || user && user.advertise?
  end
end
