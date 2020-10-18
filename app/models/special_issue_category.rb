class SpecialIssueCategory < ApplicationRecord
  has_many :special_issues, dependent: :destroy

  has_rich_text :content

  # CATEGORY_NAME_1 = "複眼鏡"
  # CATEGORY_NAME_2 = "イベントガイド"
  # CATEGORY_NAME_3 = "映画情報"
  CATEGORY_NAME_PANTOSCOPIC_SPECTACLES = "複眼鏡"
  CATEGORY_NAME_EVENTGUIDE = "イベントガイド"
  CATEGORY_NAME_MOVIEGUIDE = "映画情報"
end
