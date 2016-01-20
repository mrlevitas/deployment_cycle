require 'rails_helper'

feature 'timeline index displays only associated timelines for user', %{
  As a user
  I want to see my timelines
  So that I can read or view only my information
  } do
  # ACCEPTANCE CRITERIA
  # * If I go to the timeline index page, I can view all of my timelines

  scenario 'users 1 & 2 create their own timelines and index displays them' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    # timelines = FactoryGirl.create_list(:timeline, 3)
    # memberships = []
    #
    # timelines.each do |tl|
    #   memberships << FactoryGirl.create(:membership, user: user, timeline: tl)
    # end

    sign_in_as(user1)

    click_link "New Timeline"

    expect(page).to have_content("Create New Timeline")
    fill_in('Title', with: 'Genius Product')
    fill_in('Description', with: 'A product that will blow everyone away, needs to be functional in a week!')
    click_button 'Create'
    expect(page).to have_content("Timeline Created")

    click_link "Sign Out"

    sign_in_as(user2)

    click_link "New Timeline"

    expect(page).to have_content("Create New Timeline")
    fill_in('Title', with: 'Mediocre Product')
    fill_in('Description', with: "We're pretty self-aware that this thing just has to get out the door...")
    click_button 'Create'
    expect(page).to have_content("Timeline Created")

    click_link "Deployment Diagrams"

    expect(page).to have_content('Mediocre Product')
    expect(page).to_not have_content('Genius Product')

    click_link "Sign Out"

    sign_in_as(user1)

    expect(page).to have_content('Genius Product')
    expect(page).to_not have_content('Mediocre Product')
  end
end
