class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.belongs_to :user
      t.belongs_to :status

      t.timestamps
    end
    add_index :mentions, :user_id
    add_index :mentions, :status_id
  end
end
