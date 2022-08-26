class AddCompletedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :completed, :boolean
  end
end
