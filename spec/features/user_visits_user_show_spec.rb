require 'rails_helper'

feature 'user visits user show page', %{
  As a user
  I want to visit the user show page
  So that I can see all images by that user
} do

  # Acceptance Criteria:
  # * user page must show user's username
  # * image page must show all images by that user

  scenario 'user visits user show page' do
    user = FactoryGirl.create(:user)
    image = FactoryGirl.create(:image, user: user)

    visit user_path(user)

    expect(page).to have_content(user.username)
    expect(page).to have_xpath(image.submission)
  end
end
