class CreateWays < ActiveRecord::Migration[5.1]
  def change
    create_table :ways do |t|
      t.integer :way_number
      t.string :stops_array, array: true
      t.references :train, foreign_key: true
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
