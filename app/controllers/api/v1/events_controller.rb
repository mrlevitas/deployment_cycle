class Api::V1::EventsController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_filter :authenticate_user!
  respond_to :html, :json, :js

  def show
    @event = Event.find(params[:id])

    if params[:id].empty? || @event.nil?
      render json: :nothing, status: :not_found
      return
    end

    render json: { event: @event.as_json}
  end
end
