require 'rails_helper'

feature 'user visits gallery index', %{
  As a user
  I want to visit the gallery show
  So that I can see all previous galleries
} do

  # Acceptance Criteria:
  # * current gallery is not shown
  # * past galleries have theme, month, and yea
  # * gallery themes are links to show pages

  scenario 'user visits gallery index' do
    galleryA = FactoryGirl.create(:gallery, theme: 'Aquatic', start_date: Date.parse('1-8-2015'), end_date: Date.parse('31-8-2015'))

    galleryB = FactoryGirl.create(:gallery, theme: 'Bouncy', start_date: Date.parse('1-9-2015'), end_date: Date.parse('30-9-2015'))

    galleryC = FactoryGirl.create(:gallery, theme: 'Curtains', start_date: Date.parse('1-10-2015'), end_date: (Date.today + 1.day))

    visit galleries_path

    expect(page).to have_link("Aquatic", href: gallery_path(galleryA))
    expect(page).to have_link("Bouncy", href: gallery_path(galleryB))
    expect(page).to_not have_content(galleryC.theme)
  end
end
