class SpecialIssueCategory < ApplicationRecord

  belongs_to :special_issue
  belongs_to :user
  # belongs_to :special_issue_author, class_name: "SpecialIssue", foreign_key: "special_issue_id"

  has_rich_text :content
end
