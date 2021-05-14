class AddColumnsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :start_at, :datetime
    add_column :articles, :finish_at, :datetime
  end
end
