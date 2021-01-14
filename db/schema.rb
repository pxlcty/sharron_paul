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

ActiveRecord::Schema.define(version: 2021_01_11_072737) do

  create_table "admins", force: :cascade do |t|
    t.string "admin_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "alerts", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "count_down"
    t.boolean "active"
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

  create_table "episodes", force: :cascade do |t|
    t.date "publication_date"
    t.text "description"
    t.string "description_link"
    t.string "media_link"
    t.integer "season_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "episode_name"
    t.integer "episode_number"
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

  create_table "media_categories", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_collections", force: :cascade do |t|
    t.string "image_url"
    t.string "headline"
    t.integer "year"
    t.text "description"
    t.integer "points"
    t.integer "media_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "media_links", force: :cascade do |t|
    t.string "image_url"
    t.string "headline"
    t.integer "year"
    t.text "description"
    t.string "description_link"
    t.string "media_link"
    t.integer "points"
    t.string "media_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "season"
    t.integer "year"
    t.text "description"
    t.integer "media_collection_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "season_number"
  end

end
