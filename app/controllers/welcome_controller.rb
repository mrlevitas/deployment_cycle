class WelcomeController < ApplicationController
  def index
  end

  def show
    num = rand(1000)
    @user = User.create(email: "johnny#{num}@gmail.com", first_name: "Jason", last_name: "Bourne", password: "password")
    # binding.pry
    @timeline = Timeline.create(title: "Your Awesome Project", description: "Your Project's description", creator_id: @user.id)
    event_arr = []
    5.times do
      event_arr << Event.new(timeline_id: @timeline.id)
    end

    event_arr[0].title = "1st Event"
    event_arr[0].date_and_time = Time.now
    event_arr[0].description = "this is your first completed event!"
    event_arr[0].completed = true

    event_arr[4].title = "Last Event"
    event_arr[4].description = "this is your Last event to do!"
    event_arr[4].date_and_time = Time.now + 1.weeks


    event_arr[1].title = "Talk to Client"
    event_arr[1].description = "Get desired functionality"
    event_arr[1].date_and_time = Time.now + 2.days

    event_arr[2].title = "Get User Stories Written"
    event_arr[2].description = "Turn desired functionality into user stories"
    event_arr[2].date_and_time = Time.now + 3.days

    event_arr[3].title = "Develop!"
    event_arr[3].description = "Get to work!"
    event_arr[3].date_and_time = Time.now + 5.days

    event_arr.each do |event|
      event.save
    end

    gon.events = event_arr
  end
end
