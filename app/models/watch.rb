class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true


  scope :status, ->(booking_status, current_user) { Watch.where(user: current_user).joins(:bookings).where('bookings.status': booking_status) }
  has_many_attached :photos
end
