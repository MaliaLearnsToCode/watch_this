class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :renter, class_name: 'User', foreign_key: 'user_id'
  has_many :reviews, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total, presence: true
  validates :status, presence: true
end
