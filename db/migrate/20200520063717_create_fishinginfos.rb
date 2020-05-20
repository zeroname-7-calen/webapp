class CreateFishinginfos < ActiveRecord::Migration[6.0]
  def change
    create_table :fishinginfos do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :fishinginfos, [:user_id, :created_at]
  end
end
