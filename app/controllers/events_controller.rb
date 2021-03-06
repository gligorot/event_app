class EventsController < ApplicationController
  def index
  	@upcoming = Event.all.upcoming
    @previous = Event.all.previous
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.created_events.build(event_params)
  	if @event.save
  		flash[:success] = "Successfully created event!"
  		render @event
  	else
  		flash[:danger] = "Creation failed"
  		render :new
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  private
  	def event_params
  		params.require(:event).permit(:title, :description, :date)
  	end

end
