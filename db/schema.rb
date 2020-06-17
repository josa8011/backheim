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

ActiveRecord::Schema.define(version: 20200615230015) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "usable"
    t.integer "charges"
    t.integer "cost"
    t.integer "uses_per_game"
    t.string "description"
    t.string "reminder"
    t.string "special_cost"
    t.string "type"
    t.string "class_type"
    t.integer "warband_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_items_on_unit_id"
    t.index ["warband_id"], name: "index_items_on_warband_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name"
    t.integer "racial_max"
    t.integer "value"
    t.boolean "is_leveled"
    t.boolean "is_dirty"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_stats_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "suggestion"
    t.string "warband_type"
    t.integer "exp"
    t.integer "cost"
    t.integer "rating"
    t.boolean "is_large"
    t.integer "starting_exp"
    t.string "full_type"
    t.integer "gained_levels"
    t.integer "wounds_left"
    t.integer "num_ooa"
    t.integer "num_units"
    t.float "rout_test_contribution"
    t.string "warrior_type"
    t.string "skill_categories"
    t.string "class_type"
    t.integer "warband_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warband_id"], name: "index_units_on_warband_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warbands", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "special_skill_category"
    t.string "sources"
    t.string "broheimGrade"
    t.integer "max_units"
    t.string "special_rules"
    t.integer "games_played"
    t.integer "shards"
    t.integer "gold_crowns"
    t.string "mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
