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

ActiveRecord::Schema.define(version: 20140205072755) do

  create_table "buildings", force: true do |t|
    t.string   "buildingCode"
    t.decimal  "gpsLongitude"
    t.decimal  "gpsLatitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_actions", force: true do |t|
    t.string   "sectionNumber"
    t.integer  "userId"
    t.string   "meetingDay"
    t.string   "period"
    t.boolean  "checkedIn"
    t.boolean  "cancelled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "deptCode"
    t.string   "courseNumber"
    t.string   "sectionNumber"
    t.string   "credits"
    t.string   "instructor"
    t.string   "courseTitle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "current_sessions", force: true do |t|
    t.integer  "userId"
    t.integer  "sessionId"
    t.integer  "wagerUnitValue"
    t.integer  "wagerTotalValue"
    t.integer  "pointsLost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", force: true do |t|
    t.string   "deptCode"
    t.string   "courseNumber"
    t.string   "sectionNumber"
    t.string   "buildingCode"
    t.string   "roomNumber"
    t.string   "meetingDay"
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: true do |t|
    t.string   "period"
    t.time     "startTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "userId"
    t.string   "deptCode"
    t.string   "courseNumber"
    t.string   "sectionNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "sessionId"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "emailAddress"
    t.string   "password"
    t.string   "display"
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "pointBalance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wagers", force: true do |t|
    t.integer  "userId"
    t.integer  "sessionId"
    t.integer  "wagerUnitValue"
    t.integer  "wagerTotalValue"
    t.integer  "pointsLost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
