class QuestionnairesLoyalty < ApplicationLoyalty

  def index
    user.admin? || user.candidate?
    # user.admin?
  end

  def show
    ser.admin? || user.candidate?
  end

  def update
    ser.admin? || user.candidate?
  end

end
