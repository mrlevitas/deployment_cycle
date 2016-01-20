class EventsController < ApplicationController
  # before_action :timeline, only: [:show, :edit, :update, :destroy]

  def index
    # @public_timelines = Timeline.where(personal: false)
  end

  def new
    @event = Event.new
    # @timeline = Timeline.find(params[:timeline_id])
    # @users = User.all
  end

  def create
    @event = Event.new(event_params)
    # binding.pry
    @event.timeline_id = params[:timeline_id]
    @timeline = Timeline.find(params[:timeline_id])

    if @event.save
      flash[:success] = "Event added to Timeline"
      redirect_to timeline_path(@timeline)
    else
      flash[:notice] = @event.errors.full_messages
      render 'new'
    end
  end

  def edit
    binding.pry
  end

  def update
    binding.pry
    # if @timeline.update(timeline_params)
    #   flash[:notice] = "You have successfully updated your timeline"
    #   redirect_to timeline_path(@timeline)
    # else
    #   flash.now[:notice] = "Invalid input."
    #   render 'reviews/edit'
    # end
  end

  def destroy
    # timeline
    # if @timeline.destroy
    #   flash[:notice] = "You have deleted timeline successfully!"
    #   redirect_to timelines_path
    # else
    #   flash[:notice] = "You failed to delete timeline!"
    #   render "timelines/show"
    # end
  end

  private

  def timeline
    @timeline ||= Timeline.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :'date_and_time(1i)', :'date_and_time(2i)', :'date_and_time(3i)', :'date_and_time(4i)', :'date_and_time(5i)')
  end
end
