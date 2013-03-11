class AddDirectToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :direct, :boolean, default: false
    add_index :statuses, :direct
  end
end
