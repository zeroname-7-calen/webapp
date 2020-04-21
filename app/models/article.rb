class Article < ApplicationRecord
  validates :title, :content, :released_at, presence: true
  validates :title, length: { maximum: 80 }
  validates :content, length: { maximum: 5000 }

  has_rich_text :content
end
