class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  scope :status, ->(booking_status, current_user) { Watch.where(user: current_user).joins(:bookings).where('bookings.status': booking_status) }

  scope :within_date, -> (start_date, end_date) { Watch.where(start_date: (start_date..end_date)).where(end_date: (start_date..end_date)) }

  has_many_attached :photos
end
