class RenameMediumTypeColumnToTopContents < ActiveRecord::Migration[6.0]
  def change
    rename_column :top_contents, :medium_type, :content_type
  end
end
