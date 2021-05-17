class TopContent < ApplicationRecord
  validates :url, presence: true
  mount_uploader :url, PictureUploader
  # validate  :picture_size
  validate :url_size

  def no_start_at?
    start_at.nil?
  end

  def no_start_at=(val)
    val.in?([true, "1"])
  end

  def no_finish_at?
    finish_at.nil?
  end

  def no_finish_at=(val)
    val.in?([true, "1"])
  end

  #アップロード画像のサイズを制限
    private
      def url_size
        if url.size > 10.megabytes
          errors.add(:url, "は10MB以下のサイズにしてください")
        end
      end
end
