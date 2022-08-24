class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
end
