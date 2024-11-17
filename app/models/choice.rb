class Choice < ApplicationRecord
  belongs_to :poll
  has_many :votes, as: :votable
  has_many :users, through: :votes

  validates :content, presence: true, length: { maximum: 255 }

  scope :by_poll, ->(poll_id) { where(poll_id: poll_id) }
end