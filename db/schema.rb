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

ActiveRecord::Schema.define(version: 20150909133627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cost_users", force: :cascade do |t|
    t.integer  "cost_id"
    t.integer  "user_id"
    t.decimal  "value_2015",   precision: 8, scale: 2
    t.decimal  "value_2016",   precision: 8, scale: 2
    t.text     "reason"
    t.text     "criteria"
    t.text     "distribution"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "cost_users", ["cost_id"], name: "index_cost_users_on_cost_id", using: :btree
  add_index "cost_users", ["user_id"], name: "index_cost_users_on_user_id", using: :btree

  create_table "costs", force: :cascade do |t|
    t.string   "name",                            null: false
    t.boolean  "ask_distribution", default: true
    t.string   "data_type",                       null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "demographic_datas", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.string   "extensao_territorial"
    t.string   "municipio_sede"
    t.string   "endereco"
    t.string   "email"
    t.integer  "numero_municipios"
    t.integer  "populacao_indigena"
    t.text     "etnias"
    t.integer  "numero_polos_base"
    t.integer  "numero_ubsi"
    t.integer  "numero_regioes_de_saude"
    t.integer  "numero_casais"
    t.integer  "numero_aldeias"
    t.integer  "numero_familias"
    t.text     "meios_de_transporte"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "demographic_datas", ["pdsi_id"], name: "index_demographic_datas_on_pdsi_id", using: :btree

  create_table "etnias", force: :cascade do |t|
    t.integer  "demographic_data_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "etnias", ["demographic_data_id", "name"], name: "index_etnias_on_demographic_data_id_and_name", unique: true, using: :btree
  add_index "etnias", ["demographic_data_id"], name: "index_etnias_on_demographic_data_id", using: :btree

  create_table "pdsis", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "processo_construcao_pdsi_2"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "caracterizacao_do_dsei_3"
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
  end

  add_index "pdsis", ["user_id"], name: "index_pdsis_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "text_templates", force: :cascade do |t|
    t.text     "introducao_1"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "processo_construcao_pdsi_2"
  end

  create_table "transportations", force: :cascade do |t|
    t.integer  "demographic_data_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "transportations", ["demographic_data_id", "name"], name: "index_transportations_on_demographic_data_id_and_name", unique: true, using: :btree
  add_index "transportations", ["demographic_data_id"], name: "index_transportations_on_demographic_data_id", using: :btree

  create_table "user_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_type_id"
    t.boolean  "active"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "cost_users", "costs"
  add_foreign_key "cost_users", "users"
  add_foreign_key "demographic_datas", "pdsis"
  add_foreign_key "etnias", "demographic_datas"
  add_foreign_key "pdsis", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "transportations", "demographic_datas"
end
