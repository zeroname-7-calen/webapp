class Micropost < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true

  validates :content, presence: true, length: { maximum: 200 }
  validate  :picture_size

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

    private

      def picture_size
        if picture.size > 10.megabytes
          errors.add(:picture, "は10MB以下のサイズにしてください")
        end
      end
end
