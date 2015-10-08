namespace :gallery do
  desc "Creates a gallery from the theme with the highest votes"
  task :create_from_best_theme => :environment do
    GalleryWorker.create_gallery
  end
end
