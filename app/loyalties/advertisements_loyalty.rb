class AdvertisementsLoyalty < ApplicationLoyalty

  def index?
    user && user.advertise?
  end

  def new?
    user && user.advertise?
  end

  def create?
    user && user.advertise?
  end

  def edit?
    user && user.advertise?
  end

  def update?
    user && user.advertise?
  end

  def destroy?
    user && user.advertise?
  end
end
