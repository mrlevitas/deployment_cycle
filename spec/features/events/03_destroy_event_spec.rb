require "rails_helper"

feature 'destroy event', %{
  As an authenticated user
  I want to delete a timeline’s event
  So that it no longer exists
  } do

  scenario "visitor edits park information and submits changes", js: true do
    skip("troubleshooting childAppend")
    user = FactoryGirl.create(:user)

    timeline = FactoryGirl.create(:timeline)
    FactoryGirl.create(:membership, user: user, timeline: timeline)
    event = FactoryGirl.create(:event, timeline: timeline)
    sign_in_as(user)

    visit timeline_path(timeline)

    find_by_id(event.id).trigger('click')
    expect(page).to have_content("#{event.title}")
    expect(page).to have_content("#{event.description}")
    click_link("delete event")

    expect(page).to have_content("Event deleted")
    expect(page).to_not have_content(event.title)
  end
end
