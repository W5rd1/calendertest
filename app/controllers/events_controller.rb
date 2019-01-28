require 'date'

class EventsController < ApplicationController
  before_action :find_event, only: [:show]
  def index
    # @events = Event.where("#{eventstart.to_date.strftime('%Y-%m-%e') == '%#{params[:date]}%'}")
    # @events = Event.where(eventstart: Date.parse(params[:date]))
    @events = Event.all.select { |event| params[:date] == event.eventstart.to_s.split(" ").first }
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    raise
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
