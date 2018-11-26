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

ActiveRecord::Schema.define(version: 2018_11_26_032216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avalanches", force: :cascade do |t|
    t.string "date_issued"
    t.string "valid_until"
    t.string "highlights"
    t.jsonb "danger_ratings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forecasts", force: :cascade do |t|
    t.string "new_snow_i"
    t.string "two_days_i"
    t.string "seven_days_i"
    t.string "snowpack_i"
    t.jsonb "forecast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifts", force: :cascade do |t|
    t.integer "lift_code"
    t.string "name"
    t.string "time_to_ride"
    t.string "lift_type"
    t.string "capacity"
    t.string "capacity_hr"
    t.string "elevation_m"
    t.string "elevation_i"
    t.string "vertical_m"
    t.string "vertical_i"
    t.boolean "alpine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "lift_code"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
