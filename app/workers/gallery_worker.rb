
class GalleryWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(5) }

  def perform()
    gallery = Gallery.new
    gallery.theme = Theme.highest_vote.title
    gallery.start_date = Date.today
    gallery.end_date = Date.today.end_of_month
    gallery.save
  end
end
