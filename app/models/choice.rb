class Choice < ApplicationRecord
  belongs_to :choosable, polymorphic: true
  has_many :votes
  has_many :users, through: :votes

  validates :content, presence: true, length: { maximum: 255 }

  scope :by_poll, ->(poll_id) { where(choosable_type: 'Poll', choosable_id: poll_id) }
end