class CoverStory < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 10000 }

  has_rich_text :content

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
end
