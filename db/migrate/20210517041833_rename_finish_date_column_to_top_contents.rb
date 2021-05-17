class RenameFinishDateColumnToTopContents < ActiveRecord::Migration[6.0]
  def change
    rename_column :top_contents, :finish_date, :finish_at
  end
end
