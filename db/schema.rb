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

ActiveRecord::Schema.define(:version => 20091106042922) do

  create_table "accessories", :force => true do |t|
    t.string   "idNum"
    t.string   "diag"
    t.string   "serial"
    t.string   "model"
    t.integer  "maker_id"
    t.integer  "server_id"
    t.integer  "hardware_id"
    t.integer  "model_number_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessories", ["model"], :name => "index_accessories_on_model"

  create_table "criticals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "criticals", ["name"], :name => "index_criticals_on_name"

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["name"], :name => "index_departments_on_name"

  create_table "hardwares", :force => true do |t|
    t.integer  "idNum"
    t.integer  "maker_id"
    t.integer  "poste_id"
    t.integer  "critical_id"
    t.integer  "department_id"
    t.integer  "operating_system_id"
    t.integer  "model_number_id"
    t.integer  "location_id"
    t.integer  "ram"
    t.integer  "disk1"
    t.integer  "disk2"
    t.string   "mac1"
    t.string   "mac2"
    t.string   "serial"
    t.string   "fonction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hardwares", ["idNum"], :name => "index_hardwares_on_idNum"

  create_table "licenses", :force => true do |t|
    t.string   "software"
    t.string   "version"
    t.string   "language"
    t.string   "serial"
    t.string   "user"
    t.string   "licenseType"
    t.integer  "numLicense"
    t.integer  "numInstalled"
    t.integer  "operating_system_id"
    t.integer  "hardware_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licenses", ["software"], :name => "index_licenses_on_software"

  create_table "locations", :force => true do |t|
    t.string   "building"
    t.integer  "num"
    t.integer  "floor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "makers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "makers", ["name"], :name => "index_makers_on_name"

  create_table "model_numbers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operating_systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operating_systems", ["name"], :name => "index_operating_systems_on_name"

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions_user_groups", :id => false, :force => true do |t|
    t.integer "permission_id"
    t.integer "user_group_id"
  end

  create_table "postes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postes", ["name"], :name => "index_postes_on_name"

  create_table "servers", :force => true do |t|
    t.string  "usage"
    t.string  "privIp"
    t.string  "pubIp"
    t.string  "servName"
    t.string  "priUrl"
    t.string  "secUrl"
    t.string  "usrLocal"
    t.string  "passLocal"
    t.string  "raid"
    t.string  "configHd"
    t.string  "osVersion"
    t.string  "osLang"
    t.string  "location"
    t.string  "rack"
    t.string  "relation"
    t.integer "numHd"
    t.integer "rackPosition"
    t.integer "model_number_id"
    t.integer "maker_id"
    t.integer "operating_system_id"
    t.integer "department_id"
    t.integer "location_id"
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

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups_users", :id => false, :force => true do |t|
    t.integer "user_group_id"
    t.integer "user_id"
  end

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
