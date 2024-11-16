class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :choice_id, message: "You have already voted for this choice" }
end