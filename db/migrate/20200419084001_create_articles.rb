class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user                    # 外部キー
      t.string :title, null: false          # タイトル
      t.text :content, null: false          # 本文
      t.datetime :released_at, null: false  # 掲載開始日時

      t.timestamps
    end
  end
end
