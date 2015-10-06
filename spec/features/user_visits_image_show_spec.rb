require 'rails_helper'

feature 'user visits image show page', %{
  As a user
  I want to visit the image show page
  So that I can see more information about an image
} do

  # Acceptance Criteria:
  # * image page must show image
  # * image page must show image information
  # * image page must show comments

  scenario 'user visits image show page' do
    user = FactoryGirl.create(:user)
    gallery = FactoryGirl.create(:gallery)
    image = Image.create(user: user, gallery: gallery, submission: 'mermaid.jpg', title: 'Mermaid')
    # image = FactoryGirl.create(:image)
    comment = FactoryGirl.create(:comment, image: image)

    visit gallery_image_path(gallery, image)
    save_and_open_page

    expect(page).to have_css("img[src*='mermaid']")
    expect(page).to have_content(image.user.username)
    expect(page).to have_content(image.title)

    expect(page).to have_content(comment.user.username)
    expect(page).to have_content(comment.body)
  end
end
