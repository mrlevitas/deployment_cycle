require 'rails_helper'

feature 'delete account', %{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
  } do
  # ACCEPTANCE CRITERIA
  # * if i am signed in, i have an option to go to user show page
  # * from there I can choose to delete my account

  scenario 'authenticated user deletes account' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_link("My profile")
    click_button("Update")

    click_button("Cancel my account")
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to_not have_content(user.email)
  end
end
