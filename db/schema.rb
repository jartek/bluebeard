# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140810080640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: true do |t|
    t.string   "name"
    t.string   "nick_name"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fixtures", force: true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "competition_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fixtures", ["away_team_id"], name: "index_fixtures_on_away_team_id", using: :btree
  add_index "fixtures", ["competition_id"], name: "index_fixtures_on_competition_id", using: :btree
  add_index "fixtures", ["home_team_id"], name: "index_fixtures_on_home_team_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "full_name"
    t.integer  "squad_number"
    t.integer  "club_team_id"
    t.date     "date_of_birth"
    t.string   "birthplace"
    t.integer  "height"
    t.integer  "foot"
    t.integer  "national_team_id"
    t.integer  "secondary_national_team_id"
    t.string   "main_position"
    t.string   "secondary_position",         array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["club_team_id"], name: "index_players_on_club_team_id", using: :btree
  add_index "players", ["national_team_id"], name: "index_players_on_national_team_id", using: :btree
  add_index "players", ["secondary_national_team_id"], name: "index_players_on_secondary_national_team_id", using: :btree
  add_index "players", ["secondary_position"], name: "index_players_on_secondary_position", using: :gin

  create_table "stadia", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.integer  "year_built"
    t.integer  "corporate_boxes"
    t.boolean  "turf_heating",    default: false
    t.boolean  "running_track",   default: false
    t.integer  "width"
    t.integer  "height"
    t.string   "surface"
    t.string   "address",                         array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "squad_size"
    t.boolean  "national_team", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "world_ranking"
  end

  create_table "transfer_histories", id: false, force: true do |t|
    t.date     "transfer_date"
    t.integer  "player_id"
    t.integer  "from"
    t.integer  "to"
    t.integer  "cost",          limit: 8
    t.boolean  "loan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transfer_histories", ["from"], name: "index_transfer_histories_on_from", using: :btree
  add_index "transfer_histories", ["player_id"], name: "index_transfer_histories_on_player_id", using: :btree
  add_index "transfer_histories", ["to"], name: "index_transfer_histories_on_to", using: :btree

end
