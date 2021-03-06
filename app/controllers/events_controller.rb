class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully created"
      redirect_to events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attribute(event_params)
      redirect_to events_path
      flash[:success] = "Event updated"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "event destroyed"
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
