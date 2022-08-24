class AddCheckBoxesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :cleaning_service, :boolean, default: false
    add_column :bookings, :delivery, :boolean, default: false
  end
end
