class Advertisement < ApplicationRecord
  validates :title, presence: true
  validates :picture, presence: true
end
