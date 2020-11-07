class TopLoyalty < ApplicationLoyalty
  def index
    user.admin? || user.candidate?
    # user.admin?
  end
end
