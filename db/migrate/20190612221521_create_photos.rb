class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :image
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end

    add_index :photos, [:user_id, :course_id]
    add_index :photos, :course_id
  end
end
