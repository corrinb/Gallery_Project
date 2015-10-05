class Gallery < ActiveRecord::Base
  has_many :images
  validates :theme, presence: true

  def current_gallery
    #if end_date is in the future
  end
end
