# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_182812) do

  create_table "admins", force: :cascade do |t|
    t.string "admin_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "details", force: :cascade do |t|
    t.string "headline"
    t.text "about_bio"
    t.text "home_bio"
    t.string "inquiries_email"
    t.string "home_image_url"
    t.string "about_image_url"
    t.string "inquiries_headline"
    t.text "inquiries_body"
    t.string "contact_email"
  end

  create_table "events", force: :cascade do |t|
    t.string "headline"
    t.text "description_long"
    t.string "location_name"
    t.string "location_url"
    t.string "image_url"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description_short"
    t.string "tickets_url"
    t.string "map_url"
    t.string "location_address"
    t.string "location_street"
    t.string "location_city"
    t.string "location_zip"
    t.string "location_state", default: "NY"
    t.string "location_country", default: "USA"
  end

end
