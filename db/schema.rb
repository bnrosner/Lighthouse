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

  create_table "schools", force: true do |t|
    t.string "name"
    t.string "location"
  end

  create_table "terms", force: true do |t|
    t.string "name"
  end

  create_table "times", force: true do |t|
    t.string "day"
    t.string "time"
  end

# Could not dump table "tutors" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
