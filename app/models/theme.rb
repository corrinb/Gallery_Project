class Theme < ActiveRecord::Base
  validates :title, presence: true
  validates :vote_count, presence: true
  validates :vote_count, numericality: { only_integer: true }
  has_many :votes

  def self.highest_vote
    Theme.order(vote_count: :desc).first
  end
end
