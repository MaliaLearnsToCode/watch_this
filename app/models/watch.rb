class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many_attached :photos

  validates :price, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true

  accepts_nested_attributes_for :bookings

  scope :status, ->(booking_status, current_user) { Watch.where(user: current_user).joins(:bookings).where('bookings.status': booking_status) }
  scope :within_date, -> (start_date, end_date) { Watch.where(start_date: (start_date..end_date)).where(end_date: (start_date..end_date)) }

  has_many_attached :photos

  scope :status_available, ->(current_user) { Watch.where(user: current_user).where(availability: true) }

  scope :overlapping, (lambda do |start_date, end_date|
    Watch.where("start_date < ? AND end_date > ?",
    start_date, end_date)
  end)
end
