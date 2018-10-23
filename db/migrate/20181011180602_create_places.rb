class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :google_id
      t.string :website
      t.string :description
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
