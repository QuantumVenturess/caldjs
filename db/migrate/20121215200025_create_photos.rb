class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :file
      t.integer :width
      t.integer :height

      t.timestamps
    end
    add_index :photos, :name
    add_index :photos, :file
    add_index :photos, :width
    add_index :photos, :height
  end
end
