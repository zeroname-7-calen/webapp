class TopLoyalty < ApplicationLoyalty
  def index
    user.admin? || user.candidate?
  end
end
