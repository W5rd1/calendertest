require 'date'

class EventsController < ApplicationController
  before_action :find_event, only: [:show]
  def index
    @title = ""
    @events = Event.all.select { |event| params[:date] == event.eventstart.to_s.split(" ").first }
    @events[0]? @title = "Your events for the day" : @title = "You have no events on this day"
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
