class Vote < ApplicationRecord
  belongs_to :micropost
  belongs_to :user

  validate do
    unless user && user.votable_for?(micropost)
      errors.add(:base, :invalid)
    end
  end
end
