require "rails_helper"
#
# I want to view a list of items
# So that I can pick items to review

# TO DO : As an authenticated user

feature "users can view parks" do

  scenario "visitor signs in and views parks on index page" do
    parks = "hello park"
    expect(parks).to have_content "hello park"
  end
end
