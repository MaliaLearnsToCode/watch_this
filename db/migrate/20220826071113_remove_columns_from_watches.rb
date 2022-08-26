class RemoveColumnsFromWatches < ActiveRecord::Migration[7.0]
  def change
    remove_column(:watches, :start_date)
    remove_column(:watches, :end_date)
  end
end
