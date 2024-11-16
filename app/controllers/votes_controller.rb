class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll, only: [:create]
  before_action :set_choice, only: [:create]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_errror

  def create
    @vote = @choice.votes.create!(user: current_user)
    
    flash[:notice] = "Your vote was successfully cast!"

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

  def handle_errror(exception)
    flash[:alert] = "#{exception.message}"
    redirect_to poll_path(@poll)
  end
end
