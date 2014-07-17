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

ActiveRecord::Schema.define(version: 20140716031712) do

  create_table "images", force: true do |t|
    t.string   "small_image_url"
    t.string   "medium_image_url"
    t.string   "normal_image_url"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "audio_url"
    t.time     "audio_length"
    t.float    "longtitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fullname"
    t.string   "device_imei"
    t.string   "device_id"
    t.string   "phone"
    t.float    "longtitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "distance"
  end

end