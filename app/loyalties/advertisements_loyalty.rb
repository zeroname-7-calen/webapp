class AdvertisementsLoyalty < ApplicationLoyalty

  def index?
    user.advertise?
  end

  def new?
    user.advertise?
  end

  def create?
    user.advertise?
  end

  def edit?
    user.advertise?
  end

  def update?
    user.advertise?
  end

  def destroy?
    user.advertise?
  end
end
