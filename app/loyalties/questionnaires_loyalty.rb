class QuestionnairesLoyalty < ApplicationLoyalty

  def index
    user && user.admin? || user && user.candidate?
  end

  def show
    user && user.admin? || user && user.candidate?
  end
end
