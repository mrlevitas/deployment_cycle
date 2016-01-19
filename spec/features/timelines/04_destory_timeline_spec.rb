require "rails_helper"

feature 'destroy timeline', %{
  As an authenticated user
  I want to delete a timeline
  So that no one can see it
  } do

  let(:timeline) { FactoryGirl.create :timeline }
  let(:user) { FactoryGirl.create :user }

  scenario "user signs in, navigates to timeline show page and deletes it" do
    membership = FactoryGirl.create(:membership, user: user, timeline: timeline)
    sign_in_as(user)
    visit timeline_path(timeline)
    click_link("Delete")

    expect(page).to have_content("You have deleted timeline successfully!")
  end

end
