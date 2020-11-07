class QuestionnairesLoyalty < ApplicationLoyalty

  def index
    user.admin? || user.candidate?
  end
end
