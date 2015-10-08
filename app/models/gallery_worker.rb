class GalleryWorker
  def self.create_gallery
    gallery = Gallery.new
    gallery.theme = Theme.highest_vote.title
    gallery.start_date = Date.today
    gallery.end_date = Date.today.end_of_month
    gallery.save
  end
end
