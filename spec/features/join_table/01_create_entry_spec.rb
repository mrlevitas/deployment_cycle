require 'rails_helper'

feature 'when user goes to park show page, park reviews are listed', %{
  As a user
  I want to see park reviews
  So that I can read or view reviews
  } do
  # ACCEPTANCE CRITERIA
  # * If I go to a park's show page, I can view all of its reviews

  scenario 'user views reviews on park show page' do
    # timeline = FactoryGirl.create(:timeline)
    user = FactoryGirl.create(:user)
    timelines = FactoryGirl.create_list(:timeline, 3)
    memberships = []

    timelines.each do |tl|
      memberships << FactoryGirl.create(:membership, user: user, timeline: tl)
    end
    # user.timelines = timelines

    sign_in_as(user)

    visit timelines_path

    user.timelines.each do |u_tl|
      expect(page).to have_content(u_tl.title)
    end
  end
end
