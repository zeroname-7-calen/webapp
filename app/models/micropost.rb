class Micropost < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :content, presence: true, length: { maximum: 200 }
end
