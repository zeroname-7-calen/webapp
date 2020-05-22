class ArticlesLoyalty < ApplicationLoyalty

  # def new?
  #   user.admin? || user == record.user
  # end
  #
  def edit?
    user.admin? || user_id == record.user_id
  end

  def destroy?
    user.admin? || user_id == record.user_id
  end
end
