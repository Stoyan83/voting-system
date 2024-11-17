class Poll < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }

  def created_by?(user_id)
    creator.id == user_id
  end
end
