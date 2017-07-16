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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170716202529) do

  create_table "accommodations", force: :cascade do |t|
    t.integer  "number"
    t.integer  "capacity"
    t.float    "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "type"
    t.string   "description"
    t.boolean  "occupied"
    t.integer  "single_beds_number"
    t.integer  "couple_beds_number"
    t.boolean  "videoconf"
    t.integer  "tables_number"
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "client_id"
    t.integer  "employee_id"
    t.integer  "accommodation_id"
    t.string   "type"
    t.datetime "start_time"
    t.integer  "period"
    t.boolean  "active"
    t.index ["accommodation_id"], name: "index_bookings_on_accommodation_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["employee_id"], name: "index_bookings_on_employee_id"
  end

  create_table "hotelinformations", force: :cascade do |t|
    t.string   "description"
    t.string   "email"
    t.string   "fone"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "cpf",                    limit: 15
    t.string   "address"
    t.date     "birthday"
    t.integer  "fone",                   limit: 15
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "type"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "registrationID"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
