class AddImageNameToSpecialIssueCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :special_issue_categories, :image_name, :string
  end
end
