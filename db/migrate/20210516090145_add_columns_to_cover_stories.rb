class AddColumnsToCoverStories < ActiveRecord::Migration[6.0]
  def change
    add_column :cover_stories, :start_at, :datetime
    add_column :cover_stories, :finish_at, :datetime
  end
end
