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

ActiveRecord::Schema.define(version: 20180314225058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.date "start_date"
    t.boolean "no_trade"
    t.boolean "active"
    t.integer "trade_kicker"
    t.boolean "two_way"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_contracts_on_player_id"
  end

  create_table "draftpicks", force: :cascade do |t|
    t.integer "year"
    t.bigint "team_id"
    t.integer "original_team"
    t.integer "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_draftpicks_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.integer "experience"
    t.integer "with_current_team"
    t.string "slug"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "season"
    t.integer "guaranteed_salary"
    t.integer "salary"
    t.boolean "player_option"
    t.boolean "team_option"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_seasons_on_contract_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contracts", "players"
  add_foreign_key "draftpicks", "teams"
  add_foreign_key "players", "teams"
  add_foreign_key "seasons", "contracts"
end
