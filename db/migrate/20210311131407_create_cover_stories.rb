class CreateCoverStories < ActiveRecord::Migration[6.0]
  def change
    create_table :cover_stories do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cover_stories, [:user_id, :created_at]
  end
end
