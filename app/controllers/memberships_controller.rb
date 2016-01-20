class MembershipsController < ApplicationController
  # before_action :timeline, only: [:show, :edit, :update, :destroy]

  def index
    @public_timelines = Timeline.where(personal: false)
  end

  def show
  end

  def new
    @timeline = Timeline.find(params[:timeline_id])
    @users = User.all
  end

  def create
    @timeline = Timeline.find(params[:timeline_id])
    @membership = @timeline.memberships.new

    # user is adding another user to timeline
    if  params[:add_user] == "true"
      user_to_add = User.find(params[:user])
      @membership.user = user_to_add
    else # user is joining a timeline
      @membership.user = current_user
    end

    if @membership.save
      if  params[:add_user] == "true"
        flash[:success] = "#{user_to_add.first_name} #{user_to_add.last_name} added to #{@timeline.title}"
        redirect_to timeline_path(@timeline)
      else
        flash[:success] = "Timeline Joined"
        redirect_to timelines_path
      end
    else
      flash[:notice] = @membership.errors.full_messages
      render memberships_path
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
    params.require(:timeline).permit(:title, :description)
  end
end
