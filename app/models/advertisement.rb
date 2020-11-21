class Advertisement < ApplicationRecord
  validates :title, presence: true
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size

    private

      def picture_size
        if picture.size > 3.megabytes
          errors.add(:picture, "3MB以下のサイズにしてください")
        end
      end
end
