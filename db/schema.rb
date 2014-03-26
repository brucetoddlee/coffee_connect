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

ActiveRecord::Schema.define(version: 20140326223935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "place_results", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "full_address"
    t.string   "phone"
    t.string   "website"
    t.string   "logo"
    t.string   "rating_img"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "yelp_id"
  end

  add_index "place_results", ["yelp_id"], name: "index_place_results_on_yelp_id", using: :btree

  create_table "tests", force: true do |t|
    t.string   "yelp_id"
    t.float    "download"
    t.float    "upload"
    t.float    "latency"
    t.float    "jitter"
    t.string   "test_server"
    t.string   "IP"
    t.string   "hostname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
