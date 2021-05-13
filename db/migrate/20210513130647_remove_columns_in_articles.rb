class RemoveColumnsInArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :start_date, :datetime
    remove_column :articles, :finish_date, :datetime
  end
end
