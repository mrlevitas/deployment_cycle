require 'rails_helper'

feature 'timeline index displays only associated timelines for user', %{
  As a user
  I want to see my timelines
  So that I can read or view only my information
  } do
  # ACCEPTANCE CRITERIA
  # * If I go to the timeline index page, I can view all of my timelines

  scenario 'user views reviews on park show page' do
    user = FactoryGirl.create(:user)
    timelines = FactoryGirl.create_list(:timeline, 3)
    memberships = []

    timelines.each do |tl|
      memberships << FactoryGirl.create(:membership, user: user, timeline: tl)
    end

    sign_in_as(user)

    visit timelines_path

    user.timelines.each do |u_tl|
      expect(page).to have_content(u_tl.title)
    end
  end
end
