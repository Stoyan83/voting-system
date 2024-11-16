class Choice < ApplicationRecord
  # It is polymorphic to gain ability to be related not only to the 
  # Poll model but to other models that might need choices as well.
  belongs_to :choosable, polymorphic: true
  has_many :votes
  has_many :users, through: :votes

  validates :content, presence: true, length: { maximum: 255 }

  scope :by_poll, ->(poll_id) { where(choosable_type: 'Poll', choosable_id: poll_id) }
end