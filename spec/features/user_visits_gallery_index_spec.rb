require 'rails_helper'

feature 'user visits gallery index', %{
  As a user
  I want to visit the gallery index
  So that I can see a list of galleries
} do

  # Acceptance Criteria:
  # * gallery index must be root directory
  # * user can also see all image submssions for each gallery

  scenario 'user visits root path' do
    user = FactoryGirl.create(:user)
    gallery = FactoryGirl.create(:gallery)
    image = FactoryGirl.create(:image)

    visit root_path

    expect(page).to have_content(gallery.theme)
    expect(page).to have_css("img[src*='mermaid']")
  end
end
