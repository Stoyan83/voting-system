class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :choice_id, message: ->(object, _) do
    I18n.t('activerecord.errors.models.vote.unique_vote', email: object.user.email)
  end }
end