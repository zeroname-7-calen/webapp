class TopContent < ApplicationRecord
  # validates :content_type, presence: true
  validates :url, presence: true
  mount_uploader :url, PictureUploader
  # validate  :picture_size
  validate :url_size

  #アップロード画像のサイズを制限
    # def picture_size
    #   if picture_size.size > 10.megabytes
    #     errors.add(:url, "10MB以下のサイズにしてください")
    #   end
    # end
    def url_size
      if url.size > 10.megabytes
        errors.add(:picture, "10MB以下のサイズにしてください")
      end
    end
end
