require 'rails_helper'

feature 'user sees public timelines and adds himself to it', %{
  As a user
  I want to see all public timelines
  So that I can join it and see it in my dashboard
  } do
  # ACCEPTANCE CRITERIA
  # * If I join a public timeline, I can see it in my timeline index under "shared"

  scenario 'user joins a public timeline' do
    user = FactoryGirl.create(:user)
    user_to_add = FactoryGirl.create(:user)

    timeline = FactoryGirl.create(:timeline, personal: true)
    FactoryGirl.create(:membership, user: user, timeline: timeline)

    sign_in_as(user)

    visit timeline_path(timeline)
    expect(page).to have_content("private")
    click_link "Share with Users"

    expect(page).to have_content("Users")

    click_link (user_to_add.email)

    expect(page).to have_content("#{user_to_add.first_name} #{user_to_add.last_name} added to #{timeline.title}")
    expect(page).to have_content("Users shared with: #{user_to_add.email}")
  end
end
