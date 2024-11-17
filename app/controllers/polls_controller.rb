class PollsController < ApplicationController
  MINIMUM_CHOICES = 2

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_poll, only: [:edit, :update, :show]

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
  
  private
  def set_poll
    @poll = Poll.find_by(id: params[:id])
    if @poll.nil?
      redirect_to polls_path, alert: 'Poll not found.'
    end
  end

  def poll_params
    params.require(:poll).permit(:title, :description, choices_attributes: [:content, :_destroy])
  end
end
