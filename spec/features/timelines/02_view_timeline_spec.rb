require "rails_helper"

feature 'view timeline', %{
  As an authenticated user
  I want to view a timeline
  so that I can view all events on it
  } do

  scenario "user views timeline's show page from index page" do
    skip("outdated, expects Timeline.all on index page")
    timelines = FactoryGirl.create_list(:timeline, 3)
    visit timelines_path # timeline index

    expect(page).to have_content "Timelines"

    timelines.each do |timeline|
      visit timeline_path(timeline)

      expect(page).to have_content(timeline.title)
      expect(page).to have_content(timeline.description)
    end
  end
end
