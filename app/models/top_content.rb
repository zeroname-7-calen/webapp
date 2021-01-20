class TopContent < ApplicationRecord
  validates :url, presence: true
  mount_uploader :url, PictureUploader
  # validate  :picture_size
  validate :url_size


  def no_start_date?
    start_date.nil?
  end

  # def no_start_date=(val)
  #   @no_start_date = val.in?([true, "1"])
  # end

  def no_start_date=(val)
    val.in?([true, "1"])
  end

  def no_finish_date?
    finish_date.nil?
  end

  # def no_finish_date=(val)
  #   @no_finish_date = val.in?([true, "1"])
  # end

  def no_finish_date=(val)
    val.in?([true, "1"])
  end

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
