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

ActiveRecord::Schema.define(version: 20161120044547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reactions", force: :cascade do |t|
    t.string   "feeling",    null: false
    t.integer  "user_id",    null: false
    t.integer  "story_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reactions", ["story_id"], name: "index_reactions_on_story_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.text     "story",      null: false
    t.integer  "user_id",    null: false
    t.integer  "value_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree
  add_index "stories", ["value_id"], name: "index_stories_on_value_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "age",        null: false
    t.integer  "candidate",  null: false
    t.string   "username",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "values", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "prompt"
  end

end
