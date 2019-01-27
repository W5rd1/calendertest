class EventsController < ApplicationController
  before_action :find_event, only: [:show]
  def index
    @events = Event.all
    @events = @events.where("eventstart = #{params[:date]}")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :eventstart)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
