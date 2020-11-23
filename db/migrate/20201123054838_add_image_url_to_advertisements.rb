class AddImageUrlToAdvertisements < ActiveRecord::Migration[6.0]
  def change
    add_column :advertisements, :image_url, :string
  end
end
