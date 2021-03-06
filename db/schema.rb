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

ActiveRecord::Schema.define(:version => 20130328044100) do

  create_table "activities", :force => true do |t|
    t.string  "title"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.integer "zip_code"
    t.string  "country"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "meal"
    t.text    "image_url"
  end

  create_table "activity_plans", :force => true do |t|
    t.integer  "plan_id",     :null => false
    t.integer  "activity_id", :null => false
    t.integer  "sequence"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "activity_plans", ["activity_id"], :name => "index_activity_plans_on_activity_id"
  add_index "activity_plans", ["plan_id", "activity_id"], :name => "index_activity_plans_on_plan_id_and_activity_id"
  add_index "activity_plans", ["plan_id"], :name => "index_activity_plans_on_plan_id"

  create_table "plans", :force => true do |t|
    t.integer "user_id"
    t.string  "title"
    t.string  "location"
    t.date    "start_date"
    t.date    "end_date"
    t.boolean "sequenced",      :default => false
    t.string  "city"
    t.text    "best_route_ids"
  end

  add_index "plans", ["city"], :name => "index_plans_on_city"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "country"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
