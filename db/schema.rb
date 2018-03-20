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

ActiveRecord::Schema.define(version: 20180318225654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attacks", force: :cascade do |t|
    t.string "attack_name"
    t.string "attack_type"
    t.float "APS_impact"
    t.float "DMG_impact"
    t.string "element"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_attacks_on_character_id"
  end

  create_table "attributes", force: :cascade do |t|
    t.string "attr_name"
    t.integer "attr_level"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_attributes_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.string "primary_attr"
    t.string "avatar_url"
    t.bigint "user_id"
    t.bigint "fighter_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter_class_id"], name: "index_characters_on_fighter_class_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "damage_reports", force: :cascade do |t|
    t.float "min_damage"
    t.float "max_damage"
    t.float "damage_per_second"
    t.bigint "weapon_id"
    t.bigint "attack_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attack_id"], name: "index_damage_reports_on_attack_id"
    t.index ["weapon_id"], name: "index_damage_reports_on_weapon_id"
  end

  create_table "fighter_classes", force: :cascade do |t|
    t.string "name"
    t.string "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "weapon_type"
    t.string "DMG_range"
    t.float "APS"
    t.float "weapon_attr_modifier"
    t.string "element_impact"
    t.float "element_boost", default: 0.0
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_weapons_on_character_id"
  end

end
