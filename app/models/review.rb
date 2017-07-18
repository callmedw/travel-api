class Review < ApplicationRecord
  belongs_to :destination
  validates :author, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: 1..5 }
end
