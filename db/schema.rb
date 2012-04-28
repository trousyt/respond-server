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

ActiveRecord::Schema.define(:version => 20120428164537) do

  create_table "items", :force => true do |t|
    t.string   "description"
    t.string   "image_mime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_id"
    t.string   "image1x_url"
    t.string   "image2x_url"
  end

  add_index "items", ["request_id"], :name => "index_items_on_request_id"

  create_table "properties", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.string   "required_forms"
    t.string   "other_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",         :default => "Pending"
  end

  add_index "requests", ["property_id"], :name => "index_requests_on_property_id"
  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "required_forms", :force => true do |t|
    t.string   "name"
    t.string   "ownedBy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "details"
  end

  create_table "user_attributes", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "user_attributes", ["user_id"], :name => "index_user_attributes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "digest"
    t.string   "salt"
    t.string   "request_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "last_request_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
