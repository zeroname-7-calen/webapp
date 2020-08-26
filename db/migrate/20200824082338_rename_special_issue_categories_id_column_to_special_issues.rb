class RenameSpecialIssueCategoriesIdColumnToSpecialIssues < ActiveRecord::Migration[6.0]
  def change
    rename_column :special_issues, :special_issue_categories_id, :special_issue_category_id
  end
end
