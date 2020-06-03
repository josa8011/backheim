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

ActiveRecord::Schema.define(version: 20200523210435) do

  create_table "databases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "database_id"
    t.index ["database_id"], name: "index_databases_on_database_id"
    t.index ["user_id"], name: "index_databases_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.boolean "usable"
    t.integer "charges"
    t.integer "cost"
    t.integer "uses_per_game"
    t.string "description"
    t.string "reminder"
    t.string "special_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_equipment_on_database_id"
  end

  create_table "magic_lists_conns", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "skill_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_magic_lists_conns_on_database_id"
    t.index ["skill_list_id"], name: "index_magic_lists_conns_on_skill_list_id"
    t.index ["unit_id"], name: "index_magic_lists_conns_on_unit_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "max_m"
    t.integer "max_ws"
    t.integer "max_bs"
    t.integer "max_s"
    t.integer "max_t"
    t.integer "max_w"
    t.integer "max_i"
    t.integer "max_a"
    t.integer "max_ld"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_races_on_database_id"
  end

  create_table "skill_lists", force: :cascade do |t|
    t.string "name"
    t.string "skill_list_type"
    t.integer "warband_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_skill_lists_on_database_id"
    t.index ["warband_id"], name: "index_skill_lists_on_warband_id"
  end

  create_table "skill_skill_lists", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "skill_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_skill_skill_lists_on_database_id"
    t.index ["skill_id"], name: "index_skill_skill_lists_on_skill_id"
    t.index ["skill_list_id"], name: "index_skill_skill_lists_on_skill_list_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.boolean "usable"
    t.integer "cost"
    t.integer "uses_per_game"
    t.string "description"
    t.string "reminder"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_skills_on_database_id"
  end

  create_table "special_rules_conns", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_special_rules_conns_on_database_id"
    t.index ["skill_id"], name: "index_special_rules_conns_on_skill_id"
    t.index ["unit_id"], name: "index_special_rules_conns_on_unit_id"
  end

  create_table "special_skills_conns", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_special_skills_conns_on_database_id"
    t.index ["skill_id"], name: "index_special_skills_conns_on_skill_id"
    t.index ["unit_id"], name: "index_special_skills_conns_on_unit_id"
  end

  create_table "starting_equipment_conns", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_starting_equipment_conns_on_database_id"
    t.index ["equipment_id"], name: "index_starting_equipment_conns_on_equipment_id"
    t.index ["unit_id"], name: "index_starting_equipment_conns_on_unit_id"
  end

  create_table "unit_skill_lists", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "skill_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_unit_skill_lists_on_database_id"
    t.index ["skill_list_id"], name: "index_unit_skill_lists_on_skill_list_id"
    t.index ["unit_id"], name: "index_unit_skill_lists_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_type"
    t.string "name"
    t.string "suggestion"
    t.integer "m"
    t.integer "ws"
    t.integer "bs"
    t.integer "s"
    t.integer "t"
    t.integer "w"
    t.integer "i"
    t.integer "a"
    t.integer "ld"
    t.integer "exp"
    t.integer "cost"
    t.integer "rating"
    t.integer "race_id"
    t.integer "warband_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.float "rout_test_contribution"
    t.string "warrior_type"
    t.index ["database_id"], name: "index_units_on_database_id"
    t.index ["race_id"], name: "index_units_on_race_id"
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
    t.string "warband_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "database_id"
    t.index ["database_id"], name: "index_warbands_on_database_id"
  end

end
