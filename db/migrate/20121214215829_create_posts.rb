class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.boolean :published, default: false
      t.string :slug
      t.integer :views
      t.datetime :published_date

      t.timestamps
    end
    add_index :posts, :name, unique: true
    add_index :posts, :content
    add_index :posts, :published
    add_index :posts, :slug
    add_index :posts, :views
    add_index :posts, :published_date
  end
end
