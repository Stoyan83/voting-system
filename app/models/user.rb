class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :choices, through: :votes

  def can_vote_for?(poll_id)
    !choices.by_poll(poll_id).exists?
  end
end
