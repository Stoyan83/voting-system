class Poll < ApplicationRecord
  has_many :choices, as: :choosable
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
end
