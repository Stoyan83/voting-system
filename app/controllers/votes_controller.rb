class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll, only: [:create]
  before_action :set_choice, only: [:create]

  def create
    if user_already_voted
      flash[:alert] = "You have already voted for this choice."
    else
      @vote = @choice.votes.create(user: current_user)

      if @vote.save
        flash[:notice] = "Your vote has been successfully recorded."
      else
        flash[:alert] = "There was an error recording your vote."
      end
    end
    redirect_to poll_path(@poll) 
  end

  private

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  def set_choice
    @choice = Choice.find(params[:choice_id])
  end

  def user_already_voted
    !current_user.can_vote_for?(@poll.id)
  end
end
