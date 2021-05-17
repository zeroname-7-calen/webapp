class RenameStartDateColumnToTopContents < ActiveRecord::Migration[6.0]
  def change
    rename_column :top_contents, :start_date, :start_at
  end
end
