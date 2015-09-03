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

ActiveRecord::Schema.define(version: 20150902204322) do

  create_table "cost_users", force: :cascade do |t|
    t.integer  "cost_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.decimal  "value_2015",                 precision: 8, scale: 2
    t.decimal  "value_2016",                 precision: 8, scale: 2
    t.text     "reason",       limit: 65535
    t.text     "criteria",     limit: 65535
    t.text     "distribution", limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "cost_users", ["cost_id"], name: "index_cost_users_on_cost_id", using: :btree
  add_index "cost_users", ["user_id"], name: "index_cost_users_on_user_id", using: :btree

  create_table "costs", force: :cascade do |t|
    t.string   "name",             limit: 255,                null: false
    t.boolean  "ask_distribution",             default: true
    t.string   "data_type",        limit: 255,                null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "dado_demograficos", force: :cascade do |t|
    t.integer  "pdsi_id",                 limit: 4
    t.string   "extensao_territorial",    limit: 255
    t.string   "municipio_sede",          limit: 255
    t.string   "endereco",                limit: 255
    t.string   "email",                   limit: 255
    t.integer  "numero_municipios",       limit: 4
    t.integer  "populacao_indigena",      limit: 4
    t.text     "etnias",                  limit: 65535
    t.integer  "numero_polos_base",       limit: 4
    t.integer  "numero_ubsi",             limit: 4
    t.integer  "numero_regioes_de_saude", limit: 4
    t.integer  "numero_casais",           limit: 4
    t.integer  "numero_aldeias",          limit: 4
    t.integer  "numero_familias",         limit: 4
    t.text     "meios_de_transporte",     limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "dado_demograficos", ["pdsi_id"], name: "index_dado_demograficos_on_pdsi_id", using: :btree

  create_table "pdsis", force: :cascade do |t|
    t.integer  "user_id",                    limit: 4
    t.text     "processo_construcao_pdsi_2", limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "caracterizacao_do_dsei_3",   limit: 65535
    t.string   "map_file_name",              limit: 255
    t.string   "map_content_type",           limit: 255
    t.integer  "map_file_size",              limit: 4
    t.datetime "map_updated_at"
  end

  add_index "pdsis", ["user_id"], name: "index_pdsis_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "text_templates", force: :cascade do |t|
    t.text     "introducao_1",               limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "processo_construcao_pdsi_2", limit: 65535
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "user_type_id",       limit: 4
    t.boolean  "active"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "cost_users", "costs"
  add_foreign_key "cost_users", "users"
  add_foreign_key "dado_demograficos", "pdsis"
  add_foreign_key "pdsis", "users"
  add_foreign_key "profiles", "users"
end
