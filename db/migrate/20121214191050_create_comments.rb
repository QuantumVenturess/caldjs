class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.text :content
      t.boolean :read, default: false

      t.timestamps
    end
    add_index :comments, :email
    add_index :comments, :content
    add_index :comments, :read
  end
end
