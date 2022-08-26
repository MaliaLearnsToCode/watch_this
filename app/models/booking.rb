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

  # def available
  #   # get end date.to_i
  #   day = end_date.to_i
  #   # compare with today's dates
  #   if day > Date.now,
  #   # if over today, dont show
  #     "",
  #   # if before today, show && not on 'pending' || 'confirmed'
  #   else
  #     if booking.with_status == "pending" | "confirmed",
  #       ""
  #     else
  #       render watches
  #     end
  #   end
end
