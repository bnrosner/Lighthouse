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

ActiveRecord::Schema.define(version: 0) do

  create_table "courses", force: true do |t|
    t.string  "name"
    t.integer "school_id"
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "homeworks", force: true do |t|
    t.string  "name"
    t.integer "course_id"
    t.integer "num_questions"
  end

  add_index "homeworks", ["course_id"], name: "index_homeworks_on_course_id"

  create_table "hw_submissions", force: true do |t|
    t.integer "student_id"
    t.integer "homework_id"
  end

  add_index "hw_submissions", ["homework_id"], name: "index_hw_submissions_on_homework_id"
  add_index "hw_submissions", ["student_id"], name: "index_hw_submissions_on_student_id"

  create_table "question_submissions", force: true do |t|
    t.integer "hwsubmission_id"
    t.boolean "completed",       default: false
  end

  add_index "question_submissions", ["hwsubmission_id"], name: "index_question_submissions_on_hwsubmission_id"

  create_table "questions", force: true do |t|
    t.integer "homework_id"
  end

  add_index "questions", ["homework_id"], name: "index_questions_on_homework_id"

  create_table "schools", force: true do |t|
    t.string "name"
  end

  create_table "students", force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  add_index "students", ["course_id"], name: "index_students_on_course_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: true do |t|
    t.string  "name"
    t.integer "school_id"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id"

end
