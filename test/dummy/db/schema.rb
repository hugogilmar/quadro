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

ActiveRecord::Schema.define(:version => 20141207202401) do

  create_table "quadro_assets", :force => true do |t|
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "type",                    :null => false
    t.text     "settings"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "deleted_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "quadro_assets", ["assetable_id", "assetable_type"], :name => "index_quadro_assets_on_assetable_id_and_assetable_type"
  add_index "quadro_assets", ["deleted_at"], :name => "index_quadro_assets_on_deleted_at"
  add_index "quadro_assets", ["type"], :name => "index_quadro_assets_on_type"

  create_table "quadro_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "ancestry"
    t.integer  "ancestry_depth", :default => 0
    t.text     "settings"
    t.datetime "deleted_at"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "quadro_pages", ["ancestry"], :name => "index_quadro_pages_on_ancestry"
  add_index "quadro_pages", ["deleted_at"], :name => "index_quadro_pages_on_deleted_at"
  add_index "quadro_pages", ["slug"], :name => "index_quadro_pages_on_slug", :unique => true

  create_table "quadro_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0,  :null => false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "quadro_users", ["email"], :name => "index_quadro_users_on_email", :unique => true
  add_index "quadro_users", ["reset_password_token"], :name => "index_quadro_users_on_reset_password_token", :unique => true
  add_index "quadro_users", ["unlock_token"], :name => "index_quadro_users_on_unlock_token", :unique => true

  create_table "quadro_widgets", :force => true do |t|
    t.integer  "page_id"
    t.string   "type",       :null => false
    t.string   "name",       :null => false
    t.text     "content"
    t.text     "settings"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "quadro_widgets", ["deleted_at"], :name => "index_quadro_widgets_on_deleted_at"
  add_index "quadro_widgets", ["name"], :name => "index_quadro_widgets_on_name"
  add_index "quadro_widgets", ["page_id", "name"], :name => "index_quadro_widgets_on_page_id_and_name", :unique => true
  add_index "quadro_widgets", ["page_id"], :name => "index_quadro_widgets_on_page_id"
  add_index "quadro_widgets", ["type"], :name => "index_quadro_widgets_on_type"

end
