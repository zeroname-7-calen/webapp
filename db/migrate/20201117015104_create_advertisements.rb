class CreateAdvertisements < ActiveRecord::Migration[6.0]
  def change
    create_table :advertisements do |t|
      t.string :title, null: false
      t.string :picture, null: false

      t.timestamps
    end
    add_index :advertisements, :created_at
  end
end
