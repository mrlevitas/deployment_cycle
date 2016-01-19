require "rails_helper"

feature 'update timeline', %{
  As an authenticated user
  I want to update a timeline’s information
  So that I can correct errors or provide new information
  } do

  let!(:user) { FactoryGirl.create(:user) }

  scenario "visitor edits park information and submits changes" do
    timeline = FactoryGirl.create(:timeline)
    sign_in_as(user)

    visit timeline_path(timeline)

    click_link("Update")

    fill_in("Title", with: "Elon Musk's new Project")
    fill_in("Description", with: "crazy but coo")
    click_button("Update Timeline")

    expect(page).to have_content("Elon Musk's new Project")
    expect(page).to have_content("crazy but coo")
  end
end
