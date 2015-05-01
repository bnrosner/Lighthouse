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

  create_table "classes", force: true do |t|
    t.string  "name"
    t.string  "course_number"
    t.string  "year_taken"
    t.integer "term_id"
    t.integer "school_id"
  end

  add_index "classes", ["school_id"], name: "index_classes_on_school_id"
  add_index "classes", ["term_id"], name: "index_classes_on_term_id"

  create_table "people", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "graduation_year"
    t.integer "school_id"
  end

  add_index "people", ["school_id"], name: "index_people_on_school_id"

  create_table "schools", force: true do |t|
    t.string "name"
    t.string "location"
  end

  create_table "students", force: true do |t|
    t.integer "person_id"
    t.integer "classes_id"
    t.integer "rate"
  end

  add_index "students", ["classes_id"], name: "index_students_on_classes_id"
  add_index "students", ["person_id"], name: "index_students_on_person_id"

  create_table "terms", force: true do |t|
    t.string "name"
  end

  create_table "tutors", force: true do |t|
    t.integer "person_id"
    t.integer "classes_id"
  end

  add_index "tutors", ["classes_id"], name: "index_tutors_on_classes_id"
  add_index "tutors", ["person_id"], name: "index_tutors_on_person_id"

end
