class CreateTopContents < ActiveRecord::Migration[6.0]
  def change
    create_table :top_contents do |t|
      t.string :title
      t.string :medium_type
      t.string :url
      t.text :caption
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
    add_index :top_contents, :created_at
  end
end
