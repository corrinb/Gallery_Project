require 'rails_helper'

feature 'user visits theme index', %{
  As a user
  I want to visit the themes index
  so that I can suggest upcoming themes
  and see suggestions from other users
} do

  # Acceptance Criteria:
  # * user much be signed in
  # * all suggsted themes are listed
  # * form for user to submit new theme

  scenario 'visitor tries visits themes without logging in' do
    gallery = FactoryGirl.create(:gallery)

    visit themes_path

    expect(page).to have_content("You need to sign in or sign up before continuing")
  end

  scenario 'user visits themes' do
    gallery = FactoryGirl.create(:gallery)
    theme = FactoryGirl.create(:theme)
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit themes_path

    expect(page).to have_content(theme.title)
  end
end
