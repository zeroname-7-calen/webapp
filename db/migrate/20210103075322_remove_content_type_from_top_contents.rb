class RemoveContentTypeFromTopContents < ActiveRecord::Migration[6.0]
  def change
    remove_column :top_contents, :content_type, :string
  end
end
