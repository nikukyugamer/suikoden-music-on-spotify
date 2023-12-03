# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_03_022608) do
  create_table "albums", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.string "id_str", null: false
    t.integer "upc", null: false
    t.string "name", null: false
    t.string "label", null: false
    t.integer "popularity", null: false
    t.integer "total_tracks", null: false
    t.string "url", null: false
    t.string "image_url", null: false
    t.integer "image_height", null: false
    t.string "release_date_or_year", null: false
    t.string "release_date_precision", null: false
    t.string "api_href", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_href"], name: "index_albums_on_api_href", unique: true
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["id_str"], name: "index_albums_on_id_str", unique: true
    t.index ["image_url"], name: "index_albums_on_image_url", unique: true
    t.index ["upc"], name: "index_albums_on_upc", unique: true
    t.index ["url"], name: "index_albums_on_url", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "id_str", null: false
    t.string "name", null: false
    t.integer "popularity", null: false
    t.string "url", null: false
    t.string "image_url", null: false
    t.integer "image_height", null: false
    t.string "api_href", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_href"], name: "index_artists_on_api_href", unique: true
    t.index ["id_str"], name: "index_artists_on_id_str", unique: true
    t.index ["image_url"], name: "index_artists_on_image_url", unique: true
    t.index ["url"], name: "index_artists_on_url", unique: true
  end

  add_foreign_key "albums", "artists"
end
