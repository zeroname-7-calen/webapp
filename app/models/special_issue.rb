class SpecialIssue < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  # has_one :special_issue_categories
  belongs_to :special_issue_category, foreign_key: "special_issue_category_id"

  validates :major_title, presence: true, length: { maximum: 100 }
  # validates :minor_title, presence: true, length: { maximum: 100 }
  validates :minor_title, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 5000 }

  has_rich_text :content
end
