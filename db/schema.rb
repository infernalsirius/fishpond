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

ActiveRecord::Schema.define(:version => 20090722010919) do

  create_table "accessories", :force => true do |t|
    t.string   "idNum"
    t.string   "diag"
    t.string   "serial"
    t.string   "maker"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessories", ["maker"], :name => "index_accessories_on_maker"
  add_index "accessories", ["model"], :name => "index_accessories_on_model"

  create_table "hardwares", :force => true do |t|
    t.integer  "idNum"
    t.string   "maker"
    t.string   "mac"
    t.string   "model"
    t.string   "serial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hardwares", ["maker"], :name => "index_hardwares_on_maker"
  add_index "hardwares", ["model"], :name => "index_hardwares_on_model"

  create_table "licenses", :force => true do |t|
    t.string   "software"
    t.string   "version"
    t.string   "language"
    t.string   "serial"
    t.string   "user"
    t.string   "os"
    t.string   "type"
    t.integer  "numLicense"
    t.integer  "numInstalled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licenses", ["os"], :name => "index_licenses_on_os"
  add_index "licenses", ["software"], :name => "index_licenses_on_software"

  create_table "locations", :force => true do |t|
    t.string   "building"
    t.integer  "num"
    t.integer  "floor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.string  "usage"
    t.string  "privIp"
    t.string  "pubIp"
    t.string  "servName"
    t.string  "priUrl"
    t.string  "secUrl"
    t.string  "usrLocal"
    t.string  "passLocal"
    t.string  "maker"
    t.string  "model"
    t.string  "raid"
    t.string  "configHd"
    t.string  "os"
    t.string  "osVersion"
    t.string  "osLang"
    t.string  "location"
    t.string  "rack"
    t.string  "relation"
    t.integer "numHd"
    t.integer "rackPosition"
  end

  add_index "servers", ["servName"], :name => "index_servers_on_servName"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "name"
    t.string   "email"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
