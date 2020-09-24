class CreateEventguides < ActiveRecord::Migration[6.0]
  def change
    create_table :eventguides do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :is_display
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :eventguides, [:user_id, :created_at]
  end
end
