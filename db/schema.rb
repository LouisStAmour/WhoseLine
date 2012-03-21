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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120321170010) do

  create_table "clips", :force => true do |t|
    t.string   "filename"
    t.string   "subtitle"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "start_ms"
    t.integer  "end_ms"
  end

  add_index "clips", ["end_ms"], :name => "index_clips_on_end_ms"
  add_index "clips", ["movie_id"], :name => "index_clips_on_movie_id"
  add_index "clips", ["start_ms"], :name => "index_clips_on_start_ms"

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.string   "poster"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "playlist_clips", :force => true do |t|
    t.integer  "position"
    t.integer  "clip_id"
    t.integer  "playlist_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "playlist_clips", ["clip_id"], :name => "index_playlist_clips_on_clip_id", :unique => true
  add_index "playlist_clips", ["playlist_id"], :name => "index_playlist_clips_on_playlist_id", :unique => true

  create_table "playlists", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "playlists", ["user_id"], :name => "index_playlists_on_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
