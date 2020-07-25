class CreateSpecialIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :special_issues do |t|
      t.string :major_title
      t.string :minor_title
      t.text :content

      t.timestamps
    end
    add_index :special_issues, [:user_id, :created_at]
  end
end
