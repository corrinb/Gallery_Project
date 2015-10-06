require 'rails_helper'

feature 'user logs in through facebook', %{
  As a user
  I want to log in through facebook
} do

  # Acceptance Criteria:
  # * user logs in successfully through facebook

  # before(:each) do
  #   valid_facebook_login_setup
  #   get '/auth/facebook/callback'
  #   request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  #   binding.pry
  # end

  scenario "facebook authenticates user" do
      mock_facebook_auth!

      visit root_path
      click_link "Sign In With Facebook"
      save_and_open_page

      expect(page).to_not have_content("Sign In")
      expect(page).to_not have_content("Sign In With Facebook")
      expect(page).to have_link("Sign Out", href: destroy_user_session_path)
    end
end
