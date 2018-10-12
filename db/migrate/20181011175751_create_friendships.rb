class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :pending, default: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
