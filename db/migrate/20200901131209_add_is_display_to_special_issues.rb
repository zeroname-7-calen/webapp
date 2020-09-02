class AddIsDisplayToSpecialIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :special_issues, :is_display, :boolean
  end
end
