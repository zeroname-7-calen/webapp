class TopContent < ApplicationRecord
  validates :medium_type, presence: true
  validates :url, presence: true
end
