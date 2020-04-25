class Article < ApplicationRecord
  validates :title, :released_at, presence: true
  validates :title, length: { maximum: 80 }

  has_rich_text :content
end
