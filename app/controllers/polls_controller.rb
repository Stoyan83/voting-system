class PollsController < ApplicationController
    def show
      @poll = Poll.find(params[:id])
    end

    def index
      @polls = Poll.order(created_at: :desc)
    end
  end
  