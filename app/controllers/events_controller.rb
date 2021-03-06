class EventsController < ApplicationController
  # before_action :timeline, only: [:show, :edit, :update, :destroy]

  def index
    # @public_timelines = Timeline.where(personal: false)
  end

  def new
    @event = Event.new
    @timeline = Timeline.find(params[:timeline_id])
  end

  def create
    @event = Event.new(event_params)
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
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.events.where(id: params[:id]).first
  end

  def update
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.events.where(id: params[:id]).first

    if @event.update(event_params)
      flash[:notice] = "Event updated"
      redirect_to timeline_path(@timeline)
    else
      flash.now[:notice] = @event.errors.full_messages
      render 'timelines/show'
    end
  end

  def destroy
    @timeline = Timeline.find(params[:timeline_id])
    @event = @timeline.events.where(id: params[:id]).first

    if @event.destroy
      flash[:notice] = "Event deleted"
      redirect_to timeline_path(@timeline)
    else
      flash[:notice] = "You failed to delete event!"
      render "timelines/show"
    end
  end

  private

  def timeline
    @timeline ||= Timeline.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :completed, :team_tag, :'date_and_time(1i)', :'date_and_time(2i)', :'date_and_time(3i)', :'date_and_time(4i)', :'date_and_time(5i)')
  end
end
