class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.references :user, null: false, foreign_key: true    # 外部キー
      t.string :title, null: false                          # タイトル
      t.datetime :posted_at, null: false                    # 投稿日

      t.timestamps
    end
  end
end
