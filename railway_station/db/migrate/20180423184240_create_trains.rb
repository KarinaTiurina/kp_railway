class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :type
      t.integer :number_of_seats
      t.float :price_per_stop

      t.timestamps
    end
  end
end
