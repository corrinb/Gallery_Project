require 'rails_helper'

feature 'user visits homepage', %{
  As a user
  I want to visit the homepage
  so that I can start navigating the site
} do

  # Acceptance Criteria:
  # * nav bar has working links
  # * home image is displayed
  # * home text is displayed

  scenario 'user visits homepage' do
    FactoryGirl.create(:user)
    gallery = FactoryGirl.create(:gallery)

    visit root_path

    expect(page).to have_link("Gallery 33", href: root_path)
    expect(page).to have_link("Previous", href: galleries_path)
    expect(page).to have_link("Current", href: gallery_path(gallery))
    expect(page).to have_link("Upcoming", href: themes_path)
    expect(page).to have_link("Sign Up", href: new_user_registration_path)
    expect(page).to have_link("Sign In", href: new_user_session_path)

    expect(page).to have_content("Welcome to Gallery 33!")

  end
end
