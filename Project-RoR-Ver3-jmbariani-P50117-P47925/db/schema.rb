# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091102034011) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exposures", :force => true do |t|
    t.string   "media_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "image_id"
  end

  create_table "images", :force => true do |t|
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
  end

  create_table "outlets", :force => true do |t|
    t.string   "title"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.integer  "main"
  end

  create_table "rates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars"
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id"], :name => "index_rates_on_rateable_id"
  add_index "rates", ["user_id"], :name => "index_rates_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "rating"
    t.string   "rateable_type"
    t.integer  "menu_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level",           :default => 0, :null => false
  end

end
