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

ActiveRecord::Schema.define(version: 20170115194844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doc_emotions", force: :cascade do |t|
    t.float    "anger"
    t.float    "disgust"
    t.float    "fear"
    t.float    "joy"
    t.float    "sadness"
    t.integer  "speech_result_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "doc_language_tones", force: :cascade do |t|
    t.float    "analytical"
    t.float    "confident"
    t.float    "tentative"
    t.integer  "speech_result_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "doc_social_tones", force: :cascade do |t|
    t.float    "openness"
    t.float    "conscientiousness"
    t.float    "extraversion"
    t.float    "agreeableness"
    t.float    "emotional_range"
    t.integer  "speech_result_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "text"
    t.string   "sentiment"
    t.float    "relavance"
    t.integer  "speech_result_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "count"
  end

  create_table "speech_results", force: :cascade do |t|
    t.text     "transcript"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string   "label_heirarchy"
    t.float    "score"
    t.string   "confident"
    t.integer  "speech_result_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
