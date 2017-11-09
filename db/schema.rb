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

ActiveRecord::Schema.define(version: 20171108231319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shifts", force: :cascade do |t|
    t.integer "shift_id"
    t.time "shift_start_time"
    t.time "shift_end_time"
    t.integer "shift_priority"
    t.date "shift_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_first_name"
    t.string "user_last_name"
    t.boolean "user_administrator"
    t.integer "user_priority"
    t.string "user_phone_number"
    t.string "email"
    t.string "password_digest"
    t.string "session_token"
    t.integer "user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token"
  end

end