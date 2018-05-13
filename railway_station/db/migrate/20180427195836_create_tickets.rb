class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :way, foreign_key: true
      t.references :user, foreign_key: true
      t.string :end_stop
      t.float :price

      t.timestamps
    end
  end
end
