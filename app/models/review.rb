class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true

  # delegate :watch, to: :booking
end
