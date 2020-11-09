class QuestionnairesLoyalty < ApplicationLoyalty

  def index
    user.admin? || user.candidate?
  end

  def show
    user.admin? || user.candidate?
  end

  # def president
  #   user.admin? || user.candidate?
  # end
  #
  # def representative
  #   user.admin? || user.candidate?
  # end
end
