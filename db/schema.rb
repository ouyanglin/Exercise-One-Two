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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111015192825) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "screen_name"
    t.integer  "twitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "description"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.string   "site_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "link_id"
    t.datetime "time"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

end
