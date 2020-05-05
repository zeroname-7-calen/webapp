class Micropost < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { maximum: 200 }

  has_rich_text :content
end
