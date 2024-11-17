class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :choices, through: :votes, source: :votable, source_type: 'Choice'

  def can_vote_for?(poll_id)
    !choices.by_poll(poll_id).exists?
  end

  def voted_for?(choice_id)
    choices.ids.include?(choice_id)
  end
end
