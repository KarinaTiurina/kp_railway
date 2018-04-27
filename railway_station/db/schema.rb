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

ActiveRecord::Schema.define(version: 20180427195836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickets", force: :cascade do |t|
    t.bigint "way_id"
    t.bigint "user_id"
    t.string "end_stop"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
    t.index ["way_id"], name: "index_tickets_on_way_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "train_type"
    t.integer "number_of_seats"
    t.float "price_per_stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "last_name"
    t.string "name"
    t.string "second_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ways", force: :cascade do |t|
    t.integer "way_number"
    t.string "stops_array", array: true
    t.bigint "train_id"
    t.datetime "departure"
    t.datetime "arrival"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_ways_on_train_id"
  end

  add_foreign_key "tickets", "users"
  add_foreign_key "tickets", "ways"
  add_foreign_key "ways", "trains"
end
