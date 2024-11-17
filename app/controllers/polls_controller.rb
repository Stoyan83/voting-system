class PollsController < ApplicationController
  MINIMUM_CHOICES = 2

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_poll, only: [:edit, :update, :show, :chart]
  before_action :authorize_poll_creator, only: [:edit, :update]  # Added authorization check for edit and update actions

  def show; end

  def index
    @polls = Poll.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @poll = Poll.new
    MINIMUM_CHOICES.times { @poll.choices.build }
  end

  def create
    @poll = Poll.new(poll_params.merge(creator_id: current_user.id))

    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      flash[:alert] = @poll.errors.full_messages.join(", ")
      redirect_to new_poll_path
    end
  end

  def edit; end

  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      flash[:alert] = @poll.errors.full_messages.join(", ")
      render :edit
    end
  end

  def chart
    @choices = @poll.choices.includes(:votes)
    @chart_data = {}

    @choices.reverse_each do |choice|
      @chart_data[choice.content] = choice.votes.count
    end

    respond_to do |format|
      format.html
      format.json { render json: @chart_data }
    end
  end

  private

  def set_poll
    @poll = Poll.find_by(id: params[:id])
    if @poll.nil?
      redirect_to polls_path, alert: 'Poll not found.'
    end
  end


  def authorize_poll_creator
    unless @poll.created_by?(current_user.id)
      redirect_to polls_path, alert: 'You are not authorized to edit this poll.'
    end
  end

  def poll_params
    params.require(:poll).permit(:title, :description, choices_attributes: [:content, :_destroy])
  end
end
