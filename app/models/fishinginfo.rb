class Fishinginfo < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 3000 }
  # 上記１行はコメントアウトが必要か？

  has_rich_text :content

end
