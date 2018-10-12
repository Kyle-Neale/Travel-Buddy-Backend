class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :place_id

      t.timestamps
    end
  end
end
