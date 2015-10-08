class GalleryWorker
  def self.create_gallery
    if Date.today == Date.today.beginning_of_month
      gallery = Gallery.new
      gallery.theme = Theme.highest_vote.title
      gallery.start_date = Date.today
      gallery.end_date = Date.today.end_of_month
      gallery.save

      Theme.destroy_all
    end
  end
end
