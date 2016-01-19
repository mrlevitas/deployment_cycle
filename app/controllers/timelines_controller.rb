class TimelinesController < ApplicationController
  def index
    @timelines = Timeline.all
  end

  def show
    @timeline = Timeline.find(params[:id])
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

  private

  def timeline_params
    params.require(:timeline).permit(:title, :description)
  end
end
