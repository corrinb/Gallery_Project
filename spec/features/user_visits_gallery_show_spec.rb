require 'rails_helper'

feature 'user visits gallery show', %{
  As a user
  I want to visit the gallery show
  So that I can see a gallery and its images
} do

  # Acceptance Criteria:
  # * gallery theme is shown
  # * user can also see all image submssions for each gallery

  scenario 'user visits gallery show' do
    user = FactoryGirl.create(:user)
    gallery = FactoryGirl.create(:gallery)
    image = FactoryGirl.create(:image, gallery: gallery)

    visit gallery_path(gallery)

    expect(page).to have_content(gallery.theme)
    expect(page).to have_css("img[src*='mermaid']")
  end
end
