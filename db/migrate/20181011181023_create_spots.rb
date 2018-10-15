class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :spot_type
      t.string :source
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
