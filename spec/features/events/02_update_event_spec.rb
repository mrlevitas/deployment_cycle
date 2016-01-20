require "rails_helper"

feature 'update event', %{
  As an authenticated user
  I want to update an event on a timeline
  So that I can correct errors or provide new information
  } do

  scenario "visitor edits event information and submits changes" do
    user = FactoryGirl.create(:user)

    timeline = FactoryGirl.create(:timeline)
    FactoryGirl.create(:membership, user: user, timeline: timeline)
    event = FactoryGirl.create(:event, timeline: timeline)
    sign_in_as(user)

    visit timeline_path(timeline)

    expect(page).to have_content("#{event.title} #{event.description} update")
    click_link("update event")

    fill_in("Title", with: "Testing master branch")
    fill_in("Description", with: "get commits and pull requests in!")
    select  "2016", from:"event_date_and_time_1i"
    select  "January", from:"event_date_and_time_2i"
    select  "20", from:"event_date_and_time_3i"
    select  "07 PM", from:"event_date_and_time_4i"
    select  "30", from:"event_date_and_time_5i"

    click_button("Update Event")

    expect(page).to have_content("Event updated")
    expect(page).to have_content("Testing master branch")
    expect(page).to have_content("get commits and pull requests in!")
  end
end
