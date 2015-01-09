# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121215200152) do

  create_table "comments", :force => true do |t|
    t.string   "email"
    t.text     "content"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "comments", ["content"], :name => "index_comments_on_content"
  add_index "comments", ["email"], :name => "index_comments_on_email"
  add_index "comments", ["read"], :name => "index_comments_on_read"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "photos", ["file"], :name => "index_photos_on_file"
  add_index "photos", ["height"], :name => "index_photos_on_height"
  add_index "photos", ["name"], :name => "index_photos_on_name"
  add_index "photos", ["width"], :name => "index_photos_on_width"

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.boolean  "published",      :default => false
    t.string   "slug"
    t.integer  "views"
    t.datetime "published_date"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "posts", ["content"], :name => "index_posts_on_content"
  add_index "posts", ["name"], :name => "index_posts_on_name", :unique => true
  add_index "posts", ["published"], :name => "index_posts_on_published"
  add_index "posts", ["published_date"], :name => "index_posts_on_published_date"
  add_index "posts", ["slug"], :name => "index_posts_on_slug"
  add_index "posts", ["views"], :name => "index_posts_on_views"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "slug"
    t.boolean  "admin",              :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["slug"], :name => "index_users_on_slug"

end
