class Destination < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :location, presence: true
end
