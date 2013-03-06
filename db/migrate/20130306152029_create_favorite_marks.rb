class CreateFavoriteMarks < ActiveRecord::Migration
  def change
    create_table :favorite_marks do |t|
      t.references :user
      t.references :status

      t.timestamps
    end
    add_index :favorite_marks, :user_id
    add_index :favorite_marks, :status_id
  end
end
