class AddSpecialIssueCategoriesIdToSpecialIssues < ActiveRecord::Migration[6.0]
  def change
    add_reference :special_issues, :special_issue_categories, foreign_key: true
  end
end
