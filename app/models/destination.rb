class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :location, presence: true

  def self.search(input)
    self.find_by(location: input)
  end

  scope :most_reviews, -> {(
    select("destinations.id, destinations.location, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("destinations.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
end
