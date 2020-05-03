class Article < ApplicationRecord
  validates :title, :released_at, presence: true
  validates :title, length: { maximum: 80 }

  has_rich_text :content

  class << self
    def search(query)
      if query.present?
        Article.where("title LIKE ?","%#{query}%")
        # Article.where("content LIKE ? OR title LIKE ?",
        #   "%#{query}%", "%#{query}%")
      end
    end
  end
end




  # Article.where("title LIKE ?","%#{query}%")
