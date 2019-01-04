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

ActiveRecord::Schema.define(version: 2018_12_31_045252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "parties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playable_classes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "hair"
    t.string "eyes"
    t.integer "age"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "party_id"
    t.index ["party_id"], name: "index_player_characters_on_party_id"
  end

  create_table "player_classes", force: :cascade do |t|
    t.uuid "player_character_id"
    t.uuid "playable_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playable_class_id"], name: "index_player_classes_on_playable_class_id"
    t.index ["player_character_id"], name: "index_player_classes_on_player_character_id"
  end

  add_foreign_key "player_characters", "parties"
  add_foreign_key "player_classes", "playable_classes"
  add_foreign_key "player_classes", "player_characters"
end
