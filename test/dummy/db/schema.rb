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

ActiveRecord::Schema.define(:version => 20141122163450) do

  create_table "quadro_widgets", :force => true do |t|
    t.integer  "widgetable_id"
    t.string   "widgetable_type"
    t.string   "type",            :null => false
    t.string   "name",            :null => false
    t.text     "content"
    t.text     "settings"
    t.datetime "deleted_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "quadro_widgets", ["deleted_at"], :name => "index_quadro_widgets_on_deleted_at"
  add_index "quadro_widgets", ["name"], :name => "index_quadro_widgets_on_name", :unique => true
  add_index "quadro_widgets", ["type"], :name => "index_quadro_widgets_on_type"
  add_index "quadro_widgets", ["widgetable_id", "widgetable_type"], :name => "index_quadro_widgets_on_widgetable_id_and_widgetable_type"

end
