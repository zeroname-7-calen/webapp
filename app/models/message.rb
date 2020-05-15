class Message < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate  :picture_size

    private

    #アップロード画像のサイズを制限する
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "10MB以下のサイズにしてください")
      end
    end
end
