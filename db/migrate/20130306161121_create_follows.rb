class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :followee

      t.timestamps
    end
    add_index :follows, :follower_id
    add_index :follows, :followee_id
  end
end
