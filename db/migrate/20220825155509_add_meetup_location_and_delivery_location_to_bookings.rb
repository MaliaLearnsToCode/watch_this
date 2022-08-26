class AddMeetupLocationAndDeliveryLocationToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :meetup_location, :string
    add_column :bookings, :delivery_location, :string
  end
end
