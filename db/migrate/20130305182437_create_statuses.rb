class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :content
      t.references :author

      t.timestamps
    end
    add_index :statuses, :author_id
  end
end
