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

ActiveRecord::Schema.define(version: 20161130012438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.integer  "max_price"
    t.string   "title"
    t.string   "make"
    t.string   "model"
    t.integer  "miles_from"
    t.string   "address"
    t.string   "color"
    t.text     "features"
    t.datetime "expiration_date"
    t.integer  "user_id"
    t.integer  "dealer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "year"
    t.index ["dealer_id"], name: "index_auctions_on_dealer_id", using: :btree
    t.index ["user_id"], name: "index_auctions_on_user_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "bid_amount"
    t.datetime "time_added"
    t.integer  "user_id"
    t.integer  "auction_id"
    t.integer  "dealer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_bids_on_auction_id", using: :btree
    t.index ["dealer_id"], name: "index_bids_on_dealer_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "dealers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "dealer_name"
    t.string   "address"
    t.string   "email"
    t.integer  "phone"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "auctions", "dealers"
  add_foreign_key "auctions", "users"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "dealers"
  add_foreign_key "bids", "users"
end
