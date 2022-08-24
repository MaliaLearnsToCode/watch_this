class AddDetailsToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :avg_rating, :float, default: 0
    add_column :watches, :cleaning_price, :integer
    add_column :watches, :delivery_price, :integer
    add_column :watches, :start_date, :date
    add_column :watches, :end_date, :date
  end
end
