class Message < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
