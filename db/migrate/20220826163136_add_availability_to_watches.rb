class AddAvailabilityToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :availability, :boolean, default: true
  end
end
