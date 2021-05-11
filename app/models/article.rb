class Article < ApplicationRecord
  validates :title, :released_at, presence: true
  validates :title, length: { maximum: 80 }

  # belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :user

  has_rich_text :content

  def no_start_date?
    start_date.nil?
  end

  def no_start_date=(val)
    val.in?([true, "1"])
  end

  def no_finish_date?
    finish_date.nil?
  end

  def no_finish_date=(val)
    val.in?([true, "1"])
  end

    scope :search, -> (search_param = nil) {
    return if search_param.blank?
      joins("INNER JOIN action_text_rich_texts ON action_text_rich_texts.record_id = articles.id AND action_text_rich_texts.record_type = 'Article'")
      .where("action_text_rich_texts.body LIKE ? OR articles.title LIKE ? ", "%#{search_param}%", "%#{search_param}%")
    }
end
