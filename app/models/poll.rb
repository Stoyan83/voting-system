class Poll < ApplicationRecord
  has_many :choices
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
end
