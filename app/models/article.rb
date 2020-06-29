class Article < ApplicationRecord
  validates :title, :released_at, presence: true
  validates :title, length: { maximum: 80 }

  # belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :user

  has_rich_text :content

  class << self
    def search(query)
      if query.present?
        Article.where("title LIKE ?","%#{query}%")
      else
        @articles = Article.order(released_at: :desc)
      end
    end
  end
end




  # Article.where("title LIKE ?","%#{query}%")
