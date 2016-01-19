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
    sign_in_as(user)
    click_link "New Timeline"

    expect(page).to have_content("Create New Timeline")
    fill_in('Title', with: 'Genius Product')
    fill_in('Description', with: 'A product that will blow everyone away, needs to be functional in a week!')
    click_button 'Create'

    expect(page).to have_content("Timeline Created")
  end

  scenario 'user tries to create a timeline without specifying title' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_link "New Timeline"

    expect(page).to have_content("Create New Timeline")
    fill_in('Title', with: '')
    fill_in('Description', with: '')
    click_button 'Create'

    expect(page).to have_content("Title can't be blank")
  end
end
