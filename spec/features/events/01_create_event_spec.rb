require 'rails_helper'

feature 'create timeline', %{
  As an authenticated user
  I want to add a timeline
  So that others can review it
  } do

  # ACCEPTANCE CRITERIA
  # * if i am signed in, i should be directed to my dashboard
  # * where I have the option of adding a new timeline
  # * which has a title and description

  scenario 'user creates a new timeline' do
    user = FactoryGirl.create(:user)
    timeline = FactoryGirl.create(:timeline, creator_id: user.id)
    FactoryGirl.create(:membership, user: user, timeline: timeline)
    sign_in_as(user)

    click_link timeline.title
    click_link 'Add Event'

    fill_in('Title', with: 'Deploy')
    fill_in('Description', with: 'Our product should be live by now!')

    select  "2016", from:"event_date_and_time_1i"
    select  "January", from:"event_date_and_time_2i"
    select  "20", from:"event_date_and_time_3i"
    select  "07 PM", from:"event_date_and_time_4i"
    select  "30", from:"event_date_and_time_5i"

    click_button 'Create'

    expect(page).to have_content("Event added to Timeline")
    expect(page).to have_content('Deploy')
    expect(page).to have_content('Our product should be live by now!')
  end

  scenario 'user tries to create a timeline without specifying title' do
    user = FactoryGirl.create(:user)
    timeline = FactoryGirl.create(:timeline)
    FactoryGirl.create(:membership, user: user, timeline: timeline)

    sign_in_as(user)

    click_link timeline.title
    click_link 'Add Event'

    fill_in('Title', with: '')
    fill_in('Description', with: '')

    click_button 'Create'

    expect(page).to have_content("Title can't be blank")
  end
end
