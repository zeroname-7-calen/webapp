class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :micropost, null: false   # 外部キー
      t.references :user, null: false        # 外部キー

      t.timestamps
    end
  end
end
