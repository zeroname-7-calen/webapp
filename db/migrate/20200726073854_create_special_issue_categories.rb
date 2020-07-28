class CreateSpecialIssueCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :special_issue_categories do |t|
      t.string :category_name
      t.boolean :is_display
      t.integer :priority

      t.timestamps
    end
    add_index :special_issue_categories, :created_at
  end
end
