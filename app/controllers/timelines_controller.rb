class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all
  end

  def show
    timeline
  end

  def new
    @timeline = Timeline.new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    # joins
    # @timeline.user_id = current_user.id

    if @timeline.save
      flash[:success] = "Timeline Created"
      redirect_to timeline_path(@timeline)
    else
      flash[:notice] = @timeline.errors.full_messages
      render 'new'
    end
  end

  def edit
    timeline
  end

  def update
    timeline

    if @timeline.update(timeline_params)
      flash[:notice] = "You have successfully updated your timeline"
      redirect_to timeline_path(@timeline)
    else
      flash.now[:notice] = "Invalid input."
      render 'reviews/edit'
    end
  end

  private

  def timeline
    @timeline ||= Timeline.find(params[:id])
  end

  def timeline_params
    params.require(:timeline).permit(:title, :description)
  end
end
