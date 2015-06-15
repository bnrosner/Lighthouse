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
    t.string  "course_number"
    t.integer "school_id"
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id"

  create_table "messages", force: true do |t|
    t.integer "student_id"
    t.integer "tutor_id"
    t.text    "body"
  end

  add_index "messages", ["student_id"], name: "index_messages_on_student_id"
  add_index "messages", ["tutor_id"], name: "index_messages_on_tutor_id"

  create_table "reviews", force: true do |t|
    t.integer "tutor_id"
    t.integer "user_id"
    t.integer "rating"
    t.text    "body"
  end

  add_index "reviews", ["tutor_id"], name: "index_reviews_on_tutor_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "schools", force: true do |t|
    t.string "name"
    t.string "location"
  end

  create_table "students", force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  add_index "students", ["course_id"], name: "index_students_on_course_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "tutors", force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "available", default: false
  end

  add_index "tutors", ["course_id"], name: "index_tutors_on_course_id"
  add_index "tutors", ["user_id"], name: "index_tutors_on_user_id"

  create_table "users", force: true do |t|
    t.string  "graduation_year"
    t.integer "school_id"
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id"

end
