class SpecialIssueCategory < ApplicationRecord
  has_many :special_issues, dependent: :destroy

  has_rich_text :content
end
