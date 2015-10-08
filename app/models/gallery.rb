class Gallery < ActiveRecord::Base
  has_many :images
  validates :theme, presence: true

  def self.current_gallery
    now = Time.now
    where('start_date <= ? and end_date >= ?', now, now).last
  end
end
