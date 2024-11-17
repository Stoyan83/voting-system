class Vote < ApplicationRecord
  # The "Vote" model establishes this polymorphic relationship by allowing 
  # a user to associate their vote with any object. 
  belongs_to :user 
  belongs_to :votable, polymorphic: true

  validates :user_id, uniqueness: { scope: :votable, message: ->(object, _) do
    I18n.t('activerecord.errors.models.vote.unique_vote', email: object.user.email)
  end }
end