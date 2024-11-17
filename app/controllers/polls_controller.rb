class PollsController < ApplicationController
    MINIMUM_CHOICES = 2

    def show
      @poll = Poll.find(params[:id])
    end

    def index
      @polls = Poll.order(created_at: :desc)
    end

    def new
      @poll = Poll.new
      MINIMUM_CHOICES.times { @poll.choices.build } 
    end
  
    def create
      @poll = Poll.new(poll_params)
    
      if @poll.save
        redirect_to @poll, notice: 'Poll was successfully created.'
      else
        flash[:alert] = @poll.errors.full_messages.join(", ")
        redirect_to new_poll_path 
      end
    end
    
    private
  
    def poll_params
      params.require(:poll).permit(:title, :description, choices_attributes: [:id, :content, :_destroy])
    end
  end
  