class RenameUsernameToNickname < ActiveRecord::Migration
  def change
    remove_index  :users, :username
    rename_column :users, :username, :nickname
    add_index     :users, :nickname, unique: true
  end
end
