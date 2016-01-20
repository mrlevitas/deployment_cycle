require "rails_helper"

feature 'update timeline', %{
  As an authenticated user
  I want to update a timeline’s information
  So that I can correct errors or provide new information
  } do

  scenario "visitor edits park information and submits changes" do
    user = FactoryGirl.create(:user)

    timeline = FactoryGirl.create(:timeline)
    FactoryGirl.create(:membership, user: user, timeline: timeline)
    event = FactoryGirl.create(:event, timeline: timeline)
    sign_in_as(user)

    visit timeline_path(timeline)

    expect(page).to have_content("#{event.title} #{event.description} update event delete event")
    click_link("delete event")

    expect(page).to have_content("Event deleted")
    expect(page).to_not have_content(event.title)
  end
end
