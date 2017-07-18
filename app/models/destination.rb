class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :location, presence: true

  def self.search(input)
    self.find_by(location: input)
  end
end
