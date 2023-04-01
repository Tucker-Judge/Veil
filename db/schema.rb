# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_01_082404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flashcard_sets", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.boolean "completed"
    t.integer "review_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_flashcard_sets_on_language_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.bigint "flashcard_set_id", null: false
    t.string "front"
    t.jsonb "back"
    t.string "type"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flashcard_set_id"], name: "index_flashcards_on_flashcard_set_id"
    t.index ["type", "title"], name: "index_flashcards_on_type_and_title", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
  end

  create_table "userlangs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.index ["language_id"], name: "index_userlangs_on_language_id"
    t.index ["user_id"], name: "index_userlangs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "lang_code"
  end

  add_foreign_key "flashcard_sets", "languages"
  add_foreign_key "flashcards", "flashcard_sets"
  add_foreign_key "userlangs", "languages"
  add_foreign_key "userlangs", "users"
end
