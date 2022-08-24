class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }

  # delegate :watch, to: :booking
end
