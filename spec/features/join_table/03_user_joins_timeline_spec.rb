require 'rails_helper'

feature 'user sees public timelines and adds himself to it', %{
  As a user
  I want to see all public timelines
  So that I can join it and see it in my dashboard
  } do
  # ACCEPTANCE CRITERIA
  # * If I join a public timeline, I can see it in my timeline index under "shared"

  scenario 'user joins a public timeline' do
    joining_user = FactoryGirl.create(:user)

    user = FactoryGirl.create(:user)
    timeline1 = FactoryGirl.create(:timeline, personal: false)
    FactoryGirl.create(:membership, user: user, timeline: timeline1)

    timeline2 = FactoryGirl.create(:timeline, personal: true)
    FactoryGirl.create(:membership, user: user, timeline: timeline2)

    timeline3 = FactoryGirl.create(:timeline, personal: false)
    FactoryGirl.create(:membership, user: user, timeline: timeline3)

    sign_in_as(joining_user)

    click_link "Join Timeline"

    expect(page).to have_content(timeline1.title)
    expect(page).to_not have_content(timeline2.title) # because it's private

    click_link (timeline1.title)

    click_link "Join Timeline"
    expect(page).to have_content("Timeline Joined")
    expect(page).to have_content("#{timeline1.title}")
  end
end
