class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll_and_choice, only: [:create]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_error

  def create
    if already_voted?
      flash[:alert] = I18n.t('votes.create.already_voted')
      redirect_to poll_path(@poll)
      return
    else
      @choice.votes.create!(user_id: current_user.id)
      flash[:notice] = I18n.t('votes.create.success')
    end

    redirect_to poll_path(@poll)
  end

  private

  def set_poll_and_choice
    @poll = Poll.find(params[:poll_id])
    @choice = Choice.find(params[:choice_id])
  end

  def already_voted?
    !current_user.can_vote_for?(@poll.id)
  end

  def handle_error(exception)
    flash[:alert] = exception.message
    redirect_to poll_path(@poll)
  end
end
