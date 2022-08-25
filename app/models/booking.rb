class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :renter, class_name: 'User', foreign_key: 'user_id'
  has_many :reviews, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total, presence: true
  validates :status, presence: true
  scope :with_status, ->(booking_status, current_user) do
  where(status: booking_status).joins(:watch).where('watches.user': current_user)
  end

  def total_price
    # get the days
    days = (end_date - start_date).to_i
    # times the price
    total = watch.price * days
    # add the cleaning fee
    total += cleaning_service? ? watch.cleaning_price : 0
    # add the delivery fee
    total += delivery? ? watch.delivery_price : 0
    total
  end
end
