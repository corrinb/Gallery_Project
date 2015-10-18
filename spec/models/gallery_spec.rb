require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe ".current_gallery" do
    it "returns the current gallery" do
      galleryB = FactoryGirl.create(:gallery, theme: 'Bouncy', start_date: Date.parse('1-9-2015'), end_date: Date.parse('30-9-2015'))

      galleryC = FactoryGirl.create(:gallery, theme: 'Curtains', start_date: Date.parse('1-10-2015'), end_date: (Date.today + 1.day))

      expect(Gallery.current_gallery).to eq(galleryC)
    end
  end
end
