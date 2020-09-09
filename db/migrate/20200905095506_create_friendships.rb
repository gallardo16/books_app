class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps null:false
    end

    add_index :friendships, :following_id
    add_index :friendships, :followed_id
    add_index :friendships, [:following_id, :followed_id], unique: true

  end
end
