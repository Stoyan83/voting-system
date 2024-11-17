class Poll < ApplicationRecord
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
end
