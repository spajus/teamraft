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

ActiveRecord::Schema.define(version: 20140104131954) do

  create_table "attribute_types", force: true do |t|
    t.integer  "company_id",                     null: false
    t.string   "attribute_name",                 null: false
    t.string   "attribute_type",                 null: false
    t.string   "description"
    t.boolean  "deleted",        default: false
    t.boolean  "required",       default: false
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "companies", force: true do |t|
    t.string   "name",                             null: false
    t.string   "logo"
    t.text     "about"
    t.boolean  "allow_signup",      default: true
    t.boolean  "auto_approve",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_code",                null: false
  end

  create_table "contact_emails", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "email"
    t.string   "subject"
    t.string   "message"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer  "company_id",                             null: false
    t.string   "name",                                   null: false
    t.string   "photo"
    t.boolean  "admin",                  default: false
    t.integer  "approver_id"
    t.integer  "reports_to_id"
    t.datetime "joined_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ninja"
  end

  add_index "people", ["approver_id"], name: "index_people_on_approver_id", using: :btree
  add_index "people", ["company_id"], name: "index_people_on_company_id", using: :btree
  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["reports_to_id"], name: "index_people_on_reports_to_id", using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree

  create_table "person_attributes", force: true do |t|
    t.integer  "attribute_type_id",                 null: false
    t.integer  "person_id",                         null: false
    t.string   "value"
    t.boolean  "deleted",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

end
