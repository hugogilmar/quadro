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

ActiveRecord::Schema.define(version: 20160701222833) do

  create_table "quadro_assets", force: :cascade do |t|
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "type"
    t.text     "settings"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quadro_assets", ["assetable_id", "assetable_type"], name: "index_quadro_assets_on_assetable_id_and_assetable_type"
  add_index "quadro_assets", ["deleted_at"], name: "index_quadro_assets_on_deleted_at"
  add_index "quadro_assets", ["type"], name: "index_quadro_assets_on_type"

  create_table "quadro_interactions", force: :cascade do |t|
    t.integer  "interactable_id"
    t.string   "interactable_type"
    t.text     "content"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quadro_pages", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.string   "slug"
    t.string   "summary"
    t.string   "ancestry"
    t.integer  "ancestry_depth", default: 0
    t.text     "settings"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  add_index "quadro_pages", ["ancestry"], name: "index_quadro_pages_on_ancestry"
  add_index "quadro_pages", ["author_id"], name: "index_quadro_pages_on_author_id"
  add_index "quadro_pages", ["deleted_at"], name: "index_quadro_pages_on_deleted_at"
  add_index "quadro_pages", ["slug"], name: "index_quadro_pages_on_slug", unique: true

  create_table "quadro_users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "slug"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quadro_users", ["email"], name: "index_quadro_users_on_email", unique: true
  add_index "quadro_users", ["reset_password_token"], name: "index_quadro_users_on_reset_password_token", unique: true
  add_index "quadro_users", ["slug"], name: "index_quadro_users_on_slug", unique: true
  add_index "quadro_users", ["unlock_token"], name: "index_quadro_users_on_unlock_token", unique: true

  create_table "quadro_widgets", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "type"
    t.string   "name"
    t.text     "content"
    t.text     "settings"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quadro_widgets", ["deleted_at"], name: "index_quadro_widgets_on_deleted_at"
  add_index "quadro_widgets", ["name"], name: "index_quadro_widgets_on_name"
  add_index "quadro_widgets", ["page_id", "name"], name: "index_quadro_widgets_on_page_id_and_name", unique: true
  add_index "quadro_widgets", ["page_id"], name: "index_quadro_widgets_on_page_id"
  add_index "quadro_widgets", ["type"], name: "index_quadro_widgets_on_type"

end
