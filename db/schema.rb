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

ActiveRecord::Schema.define(version: 2020_12_13_111540) do

  create_table "details", force: :cascade do |t|
    t.string "headline"
    t.text "full"
    t.text "short"
    t.string "email"
  end

  create_table "events", force: :cascade do |t|
    t.string "headline"
    t.text "description"
    t.string "location"
    t.string "location_url"
    t.string "image_url"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "short_description"
    t.string "tickets_url"
    t.string "map_url"
    t.string "location_address"
  end

end
