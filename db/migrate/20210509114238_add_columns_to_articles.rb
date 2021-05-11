class AddColumnsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :start_date, :datetime
    add_column :articles, :finish_date, :datetime
  end
end
