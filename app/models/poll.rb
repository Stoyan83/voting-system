class Poll < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }

  validate :options_count

  def created_by?(user_id)
    creator.id == user_id
  end

  private

  def options_count
    errors.add(:poll, 'must have at least 2 options.') if choices.size < 2
  end
end
