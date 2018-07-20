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

ActiveRecord::Schema.define(version: 2018_07_20_122750) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", limit: 255, null: false
    t.string "data_content_type", limit: 255
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "event_dates", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "location", limit: 255
    t.string "additional_description", limit: 255
    t.integer "event_location_id"
    t.integer "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_locations", force: :cascade do |t|
    t.string "short_name", limit: 255
    t.string "long_name", limit: 255
    t.string "street", limit: 255
    t.integer "zipcode"
    t.string "city", limit: 255
    t.string "country", limit: 255
    t.decimal "lat"
    t.decimal "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string "orchestra", limit: 255
    t.string "title", limit: 255
    t.text "description"
    t.boolean "public_event"
    t.string "type", limit: 255
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "name", limit: 255
    t.date "context_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "permalink", limit: 255
    t.text "main_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.text "orchestra"
    t.text "header"
    t.text "footer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_articles", force: :cascade do |t|
    t.string "title", limit: 255
    t.date "print_date"
    t.string "publisher", limit: 255
    t.integer "event_id"
    t.string "article_file_name", limit: 255
    t.string "article_content_type", limit: 255
    t.integer "article_file_size"
    t.datetime "article_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "event_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "password_salt", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
