class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
