class TimelinesController < ApplicationController
  before_action :timeline, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    # Timeline.where(creator: @user)
    @timelines = @user.timelines.where(creator_id: @user.id)

    @joined_timelines = @user.timelines.where.not(creator_id: @user.id)
  end

  def show
    @shared_users = @timeline.users
  end

  def new
    @timeline = Timeline.new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    # binding.pry
    @timeline.creator_id = current_user.id

    if @timeline.save
      membership = Membership.new(user: current_user, timeline: @timeline)
      if membership.save
        flash[:success] = "Timeline Created"
        redirect_to timeline_path(@timeline)
      else
        flash[:notice] = @membership.errors.full_messages
        render 'new'
      end
    else
      flash[:notice] = @timeline.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @timeline.update(timeline_params)
      flash[:notice] = "You have successfully updated your timeline"
      redirect_to timeline_path(@timeline)
    else
      flash.now[:notice] = "Invalid input."
      render 'reviews/edit'
    end
  end

  def destroy
    timeline
    if @timeline.destroy
      flash[:notice] = "You have deleted timeline successfully!"
      redirect_to timelines_path
    else
      flash[:notice] = "You failed to delete timeline!"
      render "timelines/show"
    end
  end

  private

  def timeline
    @timeline ||= Timeline.find(params[:id])
  end

  def timeline_params
    params.require(:timeline).permit(:title, :description, :personal)
  end
end
