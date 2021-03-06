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

ActiveRecord::Schema.define(version: 20160719053036) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.integer  "comic_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "classifications", ["author_id"], name: "index_classifications_on_author_id"
  add_index "classifications", ["comic_id"], name: "index_classifications_on_comic_id"

  create_table "comics", force: :cascade do |t|
    t.string   "title",                           null: false
    t.string   "description"
    t.string   "image_url"
    t.string   "url"
    t.integer  "score"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.float    "score_day",         default: 0.0
    t.float    "score_day_man",     default: 0.0
    t.float    "score_day_women",   default: 0.0
    t.float    "score_month",       default: 0.0
    t.float    "score_month_man",   default: 0.0
    t.float    "score_month_women", default: 0.0
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comic_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["comic_id"], name: "index_favorites_on_comic_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reads", ["story_id"], name: "index_reads_on_story_id"
  add_index "reads", ["user_id"], name: "index_reads_on_user_id"

  create_table "stories", force: :cascade do |t|
    t.integer  "comic_id"
    t.integer  "chapter"
    t.integer  "number",     null: false
    t.string   "title",      null: false
    t.binary   "image"
    t.string   "url",        null: false
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stories", ["comic_id"], name: "index_stories_on_comic_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "gender"
    t.date     "birthday"
    t.string   "email",           null: false
    t.boolean  "notice_confide"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "writing", force: :cascade do |t|
    t.integer  "comic_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "writing", ["author_id"], name: "index_writing_on_author_id"
  add_index "writing", ["comic_id"], name: "index_writing_on_comic_id"

end
