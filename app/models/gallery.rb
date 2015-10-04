class Gallery < ActiveRecord::Base
  has_many :images
  validates :theme, presence: true
end
