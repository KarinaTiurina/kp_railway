class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :last_name
      t.string :name
      t.string :second_name
      t.string :phone

      t.timestamps
    end
  end
end
