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

ActiveRecord::Schema.define(version: 2019_01_10_111414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

# Could not dump table "ability_score_increases" because of following StandardError
#   Unknown type 'ability_name' for column 'ability'

# Could not dump table "ability_scores" because of following StandardError
#   Unknown type 'ability_name' for column 'ability'

# Could not dump table "feat_ability_score_increase_options" because of following StandardError
#   Unknown type 'ability_name' for column 'ability'

  create_table "feats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "player_character_feats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "player_character_id", null: false
    t.uuid "feat_id", null: false
    t.uuid "feat_ability_score_increase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feat_ability_score_increase_id"], name: "index_player_character_feats_on_feat_ability_score_increase_id"
    t.index ["feat_id"], name: "index_player_character_feats_on_feat_id"
    t.index ["player_character_id"], name: "index_player_character_feats_on_player_character_id"
  end

  create_table "player_character_spells", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "player_character_id", null: false
    t.uuid "spell_id", null: false
    t.boolean "prepared", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_character_id"], name: "index_player_character_spells_on_player_character_id"
    t.index ["spell_id"], name: "index_player_character_spells_on_spell_id"
  end

  create_table "player_characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "hair"
    t.string "eyes"
    t.integer "age"
    t.integer "level", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "party_id"
    t.uuid "race_id"
    t.index ["party_id"], name: "index_player_characters_on_party_id"
    t.index ["race_id"], name: "index_player_characters_on_race_id"
  end

  create_table "player_classes", force: :cascade do |t|
    t.uuid "player_character_id"
    t.uuid "playable_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playable_class_id"], name: "index_player_classes_on_playable_class_id"
    t.index ["player_character_id"], name: "index_player_classes_on_player_character_id"
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.uuid "parent_race_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ability_score_increases", "races"
  add_foreign_key "ability_scores", "player_characters"
  add_foreign_key "feat_ability_score_increase_options", "feats"
  add_foreign_key "player_character_feats", "feat_ability_score_increase_options", column: "feat_ability_score_increase_id"
  add_foreign_key "player_character_feats", "feats"
  add_foreign_key "player_character_feats", "player_characters"
  add_foreign_key "player_character_spells", "player_characters"
  add_foreign_key "player_character_spells", "spells"
  add_foreign_key "player_characters", "parties"
  add_foreign_key "player_characters", "races"
  add_foreign_key "player_classes", "playable_classes"
  add_foreign_key "player_classes", "player_characters"
  add_foreign_key "races", "races", column: "parent_race_id"
end
