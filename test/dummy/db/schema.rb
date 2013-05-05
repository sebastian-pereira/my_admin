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

ActiveRecord::Schema.define(:version => 20130406230806) do

  create_table "admin_user_roles", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "alias",      :limit => 20
    t.boolean  "active",                   :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "admin_user_roles", ["alias"], :name => "index_admin_user_roles_on_alias", :unique => true

  create_table "admin_users", :force => true do |t|
    t.string   "name",               :limit => 50,                    :null => false
    t.string   "surname",            :limit => 50,                    :null => false
    t.string   "email",                                               :null => false
    t.string   "password",           :limit => 32,                    :null => false
    t.string   "user_hash",          :limit => 32,                    :null => false
    t.string   "avatar"
    t.integer  "admin_user_role_id"
    t.boolean  "active",                           :default => true
    t.boolean  "trash",                            :default => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "admin_users", ["admin_user_role_id"], :name => "fk_role"
  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true

  create_table "faculties", :force => true do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "universities", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "abbr",       :limit => 20, :null => false
    t.integer  "city_id",                  :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
