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

ActiveRecord::Schema[7.1].define(version: 2023_12_03_050800) do
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

  create_table "features", force: :cascade do |t|
    t.integer "album_id", null: false
    t.string "id_str", null: false
    t.integer "duration_ms", null: false
    t.float "tempo", null: false
    t.integer "time_signature", null: false
    t.integer "key", null: false
    t.integer "mode", null: false
    t.float "acousticness", null: false
    t.float "danceability", null: false
    t.float "energy", null: false
    t.float "instrumentalness", null: false
    t.float "liveness", null: false
    t.float "loudness", null: false
    t.float "speechiness", null: false
    t.float "valence", null: false
    t.string "api_analysis_url", null: false
    t.string "api_track_href", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_features_on_album_id"
    t.index ["api_analysis_url"], name: "index_features_on_api_analysis_url", unique: true
    t.index ["api_track_href"], name: "index_features_on_api_track_href", unique: true
    t.index ["id_str"], name: "index_features_on_id_str", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "album_id", null: false
    t.string "id_str", null: false
    t.string "isrc", null: false
    t.string "name", null: false
    t.integer "popularity", null: false
    t.integer "duration_ms", null: false
    t.integer "disc_number", null: false
    t.integer "track_number", null: false
    t.string "spotify_external_url", null: false
    t.string "preview_url", null: false
    t.string "api_href", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["api_href"], name: "index_tracks_on_api_href", unique: true
    t.index ["id_str"], name: "index_tracks_on_id_str", unique: true
    t.index ["isrc"], name: "index_tracks_on_isrc", unique: true
    t.index ["preview_url"], name: "index_tracks_on_preview_url", unique: true
    t.index ["spotify_external_url"], name: "index_tracks_on_spotify_external_url", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "features", "albums"
  add_foreign_key "tracks", "albums"
end
