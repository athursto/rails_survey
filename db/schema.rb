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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_192246) do
  create_table "branching_rules", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "answer"
    t.integer "next_section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_branching_rules_on_question_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "section_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_type", default: 0, null: false
    t.index ["section_id"], name: "index_questions_on_section_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "user_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_sections_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branching_rules", "questions"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "sections"
  add_foreign_key "responses", "questions"
  add_foreign_key "sections", "surveys"
end
