class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :content, null: false
      t.references :author, null: false

      t.timestamps
    end
    add_index :statuses, :author_id
  end
end
