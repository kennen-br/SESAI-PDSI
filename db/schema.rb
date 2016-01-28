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

ActiveRecord::Schema.define(version: 20160127173205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "absolute_data", force: :cascade do |t|
    t.integer  "absolute_datum_level_id"
    t.string   "name"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "is_specific",             default: false
  end

  add_index "absolute_data", ["absolute_datum_level_id"], name: "index_absolute_data_on_absolute_datum_level_id", using: :btree

  create_table "absolute_data_base_polos", force: :cascade do |t|
    t.integer  "absolute_datum_id"
    t.integer  "base_polo_id"
    t.integer  "pdsi_id"
    t.integer  "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "absolute_data_base_polos", ["absolute_datum_id"], name: "index_absolute_data_base_polos_on_absolute_datum_id", using: :btree
  add_index "absolute_data_base_polos", ["base_polo_id"], name: "index_absolute_data_base_polos_on_base_polo_id", using: :btree
  add_index "absolute_data_base_polos", ["pdsi_id"], name: "index_absolute_data_base_polos_on_pdsi_id", using: :btree

  create_table "absolute_data_casais", force: :cascade do |t|
    t.integer  "absolute_datum_id"
    t.integer  "casai_id"
    t.integer  "pdsi_id"
    t.integer  "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "absolute_data_casais", ["absolute_datum_id"], name: "index_absolute_data_casais_on_absolute_datum_id", using: :btree
  add_index "absolute_data_casais", ["casai_id"], name: "index_absolute_data_casais_on_casai_id", using: :btree
  add_index "absolute_data_casais", ["pdsi_id"], name: "index_absolute_data_casais_on_pdsi_id", using: :btree

  create_table "absolute_data_dseis", force: :cascade do |t|
    t.integer  "absolute_datum_id"
    t.integer  "dsei_id"
    t.integer  "pdsi_id"
    t.integer  "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "absolute_data_dseis", ["absolute_datum_id"], name: "index_absolute_data_dseis_on_absolute_datum_id", using: :btree
  add_index "absolute_data_dseis", ["dsei_id"], name: "index_absolute_data_dseis_on_dsei_id", using: :btree
  add_index "absolute_data_dseis", ["pdsi_id"], name: "index_absolute_data_dseis_on_pdsi_id", using: :btree

  create_table "absolute_datum_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "base_polos", force: :cascade do |t|
    t.integer  "dsei_id"
    t.string   "name",       null: false
    t.integer  "sesai_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city_name"
    t.integer  "population"
  end

  add_index "base_polos", ["dsei_id"], name: "index_base_polos_on_dsei_id", using: :btree

  create_table "budget_correction_factors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
    t.decimal  "value"
  end

  create_table "budget_forecast_comments", force: :cascade do |t|
    t.integer  "budget_forecast_id"
    t.integer  "user_id"
    t.text     "comment"
    t.text     "users",              default: "[]"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "budget_forecast_comments", ["budget_forecast_id"], name: "index_budget_forecast_comments_on_budget_forecast_id", using: :btree
  add_index "budget_forecast_comments", ["user_id"], name: "index_budget_forecast_comments_on_user_id", using: :btree

  create_table "budget_forecasts", force: :cascade do |t|
    t.integer  "cost_id"
    t.integer  "pdsi_id"
    t.datetime "updated_at"
    t.decimal  "reference_forecast"
    t.decimal  "budget_forecast"
    t.decimal  "initial_forecast_2016"
    t.decimal  "dsei_forecast_2016"
    t.decimal  "revised_forecast_2016"
    t.decimal  "initial_forecast_2017"
    t.decimal  "dsei_forecast_2017"
    t.decimal  "revised_forecast_2017"
    t.decimal  "initial_forecast_2018"
    t.decimal  "dsei_forecast_2018"
    t.decimal  "revised_forecast_2018"
    t.decimal  "initial_forecast_2019"
    t.decimal  "dsei_forecast_2019"
    t.decimal  "revised_forecast_2019"
  end

  add_index "budget_forecasts", ["cost_id"], name: "index_budget_forecasts_on_cost_id", using: :btree
  add_index "budget_forecasts", ["pdsi_id"], name: "index_budget_forecasts_on_pdsi_id", using: :btree

  create_table "budget_investments", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "quantity_2016"
    t.decimal  "unitary_amount_2016"
    t.decimal  "forecast_amount_2016"
    t.integer  "quantity_2017"
    t.decimal  "unitary_amount_2017"
    t.decimal  "forecast_amount_2017"
    t.integer  "quantity_2018"
    t.decimal  "unitary_amount_2018"
    t.decimal  "forecast_amount_2018"
    t.integer  "quantity_2019"
    t.decimal  "unitary_amount_2019"
    t.decimal  "forecast_amount_2019"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "investment_id"
  end

  add_index "budget_investments", ["investment_id"], name: "index_budget_investments_on_investment_id", using: :btree
  add_index "budget_investments", ["pdsi_id"], name: "index_budget_investments_on_pdsi_id", using: :btree

  create_table "capai_villages", force: :cascade do |t|
    t.integer  "capai_id"
    t.integer  "village_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "capai_villages", ["capai_id"], name: "index_capai_villages_on_capai_id", using: :btree
  add_index "capai_villages", ["village_id"], name: "index_capai_villages_on_village_id", using: :btree

  create_table "capais", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.string   "city_name"
    t.string   "uf"
    t.string   "capai_type"
    t.integer  "host_capacity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  add_index "capais", ["pdsi_id"], name: "index_capais_on_pdsi_id", using: :btree

  create_table "casais", force: :cascade do |t|
    t.integer  "dsei_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city_name"
  end

  add_index "casais", ["dsei_id"], name: "index_casais_on_dsei_id", using: :btree

  create_table "category_budgets", force: :cascade do |t|
    t.integer  "projection_budget_category_id"
    t.integer  "pdsi_id"
    t.decimal  "value_2016"
    t.decimal  "value_2017"
    t.decimal  "value_2018"
    t.decimal  "value_2019"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "category_budgets", ["pdsi_id"], name: "index_category_budgets_on_pdsi_id", using: :btree
  add_index "category_budgets", ["projection_budget_category_id"], name: "index_category_budgets_on_projection_budget_category_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "cod_uf"
    t.string   "name_uf"
    t.integer  "cod_city"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corresponsabilities", force: :cascade do |t|
    t.integer  "responsability_id"
    t.integer  "person_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "corresponsabilities", ["person_id"], name: "index_corresponsabilities_on_person_id", using: :btree
  add_index "corresponsabilities", ["responsability_id"], name: "index_corresponsabilities_on_responsability_id", using: :btree

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
    t.integer  "parent_id"
    t.integer  "cost_type"
  end

  add_index "costs", ["parent_id"], name: "index_costs_on_parent_id", using: :btree

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
    t.boolean  "fluvial"
    t.boolean  "rodoviario"
    t.boolean  "aereo"
  end

  add_index "demographic_datas", ["pdsi_id"], name: "index_demographic_datas_on_pdsi_id", using: :btree

  create_table "destination_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "origin_village_id",      null: false
    t.integer  "destination_village_id"
    t.integer  "destination_type_id"
    t.string   "boat_time"
    t.string   "road_time"
    t.string   "fly_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "destination_class"
    t.string   "city_name"
    t.string   "total_time"
  end

  add_index "destinations", ["destination_type_id"], name: "index_destinations_on_destination_type_id", using: :btree
  add_index "destinations", ["destination_village_id"], name: "index_destinations_on_destination_village_id", using: :btree
  add_index "destinations", ["origin_village_id"], name: "index_destinations_on_origin_village_id", using: :btree
  add_index "destinations", ["pdsi_id"], name: "index_destinations_on_pdsi_id", using: :btree

  create_table "dseis", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "sesai_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emsis", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "base_polo_id"
    t.string   "name",                            null: false
    t.integer  "numero_medicos"
    t.integer  "numero_enfermeiros"
    t.integer  "numero_odontologistas"
    t.integer  "numero_tecnicos_enfermagem"
    t.integer  "asb"
    t.integer  "ais"
    t.integer  "aisan"
    t.integer  "aldeias_atendidas"
    t.integer  "permanencia_medicos"
    t.integer  "permanencia_enfermeiros"
    t.integer  "permanencia_odontologistas"
    t.integer  "permanencia_tecnicos_enfermagem"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "permanencia_asb"
  end

  add_index "emsis", ["base_polo_id"], name: "index_emsis_on_base_polo_id", using: :btree
  add_index "emsis", ["pdsi_id"], name: "index_emsis_on_pdsi_id", using: :btree

  create_table "espinita_audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "audited_changes"
    t.string   "comment"
    t.integer  "version"
    t.string   "action"
    t.string   "remote_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "espinita_audits", ["auditable_type", "auditable_id"], name: "index_espinita_audits_on_auditable_type_and_auditable_id", using: :btree
  add_index "espinita_audits", ["user_type", "user_id"], name: "index_espinita_audits_on_user_type_and_user_id", using: :btree

  create_table "ethnicities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "sesai_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ethnicities_villages", force: :cascade do |t|
    t.integer "ethnicity_id"
    t.integer "village_id"
  end

  add_index "ethnicities_villages", ["ethnicity_id"], name: "index_ethnicities_villages_on_ethnicity_id", using: :btree
  add_index "ethnicities_villages", ["village_id"], name: "index_ethnicities_villages_on_village_id", using: :btree

  create_table "etnias", force: :cascade do |t|
    t.integer  "demographic_data_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "etnias", ["demographic_data_id", "name"], name: "index_etnias_on_demographic_data_id_and_name", unique: true, using: :btree
  add_index "etnias", ["demographic_data_id"], name: "index_etnias_on_demographic_data_id", using: :btree

  create_table "false_results", force: :cascade do |t|
    t.integer  "dsei_id"
    t.integer  "result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "false_results", ["dsei_id"], name: "index_false_results_on_dsei_id", using: :btree
  add_index "false_results", ["result_id"], name: "index_false_results_on_result_id", using: :btree

  create_table "health_establishments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "service_network_city_id"
  end

  add_index "health_establishments", ["service_network_city_id"], name: "index_health_establishments_on_service_network_city_id", using: :btree

  create_table "health_specializeds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "service_network_city_id"
  end

  add_index "health_specializeds", ["service_network_city_id"], name: "index_health_specializeds_on_service_network_city_id", using: :btree

  create_table "human_resource_functions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infrastructure_building_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infrastructure_buildings", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "infrastructure_building_type_id"
    t.string   "name"
    t.string   "uf"
    t.string   "city_name"
    t.integer  "village_id"
    t.string   "cnes"
    t.string   "building_status"
    t.string   "ground_status"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "infrastructure_buildings", ["infrastructure_building_type_id"], name: "idx_ibt_on_ibt_id", using: :btree
  add_index "infrastructure_buildings", ["pdsi_id"], name: "index_infrastructure_buildings_on_pdsi_id", using: :btree
  add_index "infrastructure_buildings", ["village_id"], name: "index_infrastructure_buildings_on_village_id", using: :btree

  create_table "infrastructure_sanitations", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "village_id"
    t.boolean  "abastecimento_agua"
    t.boolean  "abastecimento_agua_alternativo"
    t.boolean  "saa_completo"
    t.string   "nome_saa"
    t.string   "tipo_captacao_agua"
    t.string   "nome_concessionaria"
    t.string   "tipo_tratamento_agua"
    t.boolean  "abastecimento_mqa"
    t.boolean  "saa_manutencao"
    t.integer  "qtd_msd_individual"
    t.integer  "qtd_msd_coletiva"
    t.boolean  "esgotamento_sanitario"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "infrastructure_sanitations", ["pdsi_id"], name: "index_infrastructure_sanitations_on_pdsi_id", using: :btree
  add_index "infrastructure_sanitations", ["village_id"], name: "index_infrastructure_sanitations_on_village_id", using: :btree

  create_table "investment_cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity_2016",        default: 1
    t.decimal  "unitary_amount_2016"
    t.decimal  "forecast_amount_2016"
    t.integer  "quantity_2017",        default: 1
    t.decimal  "unitary_amount_2017"
    t.decimal  "forecast_amount_2017"
    t.integer  "quantity_2018",        default: 1
    t.decimal  "unitary_amount_2018"
    t.decimal  "forecast_amount_2018"
    t.integer  "quantity_2019",        default: 1
    t.decimal  "unitary_amount_2019"
    t.decimal  "forecast_amount_2019"
    t.integer  "budget_investment_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "year_reference"
    t.string   "city"
    t.string   "village"
    t.string   "pole_base"
  end

  add_index "investment_items", ["budget_investment_id"], name: "index_investment_items_on_budget_investment_id", using: :btree

  create_table "investment_pole_bases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_villages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "investments", ["parent_id"], name: "index_investments_on_parent_id", using: :btree

  create_table "pdsi_attached_files", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "pdsi_attached_files", ["pdsi_id"], name: "index_pdsi_attached_files_on_pdsi_id", using: :btree

  create_table "pdsi_base_polo_data", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "base_polo_id"
    t.string   "city_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pdsi_base_polo_data", ["base_polo_id"], name: "index_pdsi_base_polo_data_on_base_polo_id", using: :btree
  add_index "pdsi_base_polo_data", ["pdsi_id"], name: "index_pdsi_base_polo_data_on_pdsi_id", using: :btree

  create_table "pdsi_costs", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "cost_id"
    t.decimal  "previsao_orcamentaria_2015"
    t.decimal  "orcamento_necessario"
    t.decimal  "dotacao_orcamentaria_inicial"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "pdsi_costs", ["cost_id"], name: "index_pdsi_costs_on_cost_id", using: :btree
  add_index "pdsi_costs", ["pdsi_id"], name: "index_pdsi_costs_on_pdsi_id", using: :btree

  create_table "pdsi_human_resources", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "human_resource_function_id"
    t.integer  "ubsi_atual"
    t.integer  "polo_base_tipo_1_atual"
    t.integer  "polo_base_tipo_2"
    t.integer  "casai_atual"
    t.integer  "sead_atual"
    t.integer  "selog_atual"
    t.integer  "sesane_atual"
    t.integer  "seofi_atual"
    t.integer  "sgep_atual"
    t.integer  "gabinete_atual"
    t.integer  "diasi_atual"
    t.integer  "sesai_dsei"
    t.integer  "municipio"
    t.integer  "estado"
    t.integer  "convenio"
    t.integer  "mais_medicos"
    t.integer  "terceirizacao"
    t.integer  "ubsi_necessaria"
    t.integer  "polo_base_tipo_1_necessaria"
    t.integer  "polo_base_tipo_2_necessaria"
    t.integer  "casai_necessaria"
    t.integer  "sead_necessaria"
    t.integer  "selog_necessaria"
    t.integer  "sesane_necessaria"
    t.integer  "seofi_necessaria"
    t.integer  "sgep_necessaria"
    t.integer  "gabinete_necessaria"
    t.integer  "diasi_necessaria"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "pdsi_human_resources", ["human_resource_function_id"], name: "index_pdsi_human_resources_on_human_resource_function_id", using: :btree
  add_index "pdsi_human_resources", ["pdsi_id"], name: "index_pdsi_human_resources_on_pdsi_id", using: :btree

  create_table "pdsi_need_costs", force: :cascade do |t|
    t.integer  "cost_id"
    t.integer  "pdsi_id"
    t.decimal  "previsao_orcamentaria_2015"
    t.decimal  "previsao_orcamentaria_2016"
    t.decimal  "orcamento_necessario"
    t.decimal  "orcamento_necessario_pleno"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "pdsi_need_costs", ["cost_id"], name: "index_pdsi_need_costs_on_cost_id", using: :btree
  add_index "pdsi_need_costs", ["pdsi_id"], name: "index_pdsi_need_costs_on_pdsi_id", using: :btree

  create_table "pdsi_need_investiments", force: :cascade do |t|
    t.integer  "projection_budget_item_id"
    t.integer  "pdsi_id"
    t.integer  "qtde_existente_2015"
    t.integer  "qtde_necessaria"
    t.decimal  "valor_unitario_medio"
    t.decimal  "previsao_orcamentaria"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pdsi_need_investiments", ["pdsi_id"], name: "index_pdsi_need_investiments_on_pdsi_id", using: :btree
  add_index "pdsi_need_investiments", ["projection_budget_item_id"], name: "index_pdsi_need_investiments_on_projection_budget_item_id", using: :btree

  create_table "pdsi_results", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "result_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "value_2016"
    t.integer  "value_2017"
    t.integer  "value_2018"
    t.integer  "value_2019"
    t.integer  "value_global"
  end

  add_index "pdsi_results", ["pdsi_id"], name: "index_pdsi_results_on_pdsi_id", using: :btree
  add_index "pdsi_results", ["result_id"], name: "index_pdsi_results_on_result_id", using: :btree

  create_table "pdsis", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "processo_construcao_pdsi_2"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "caracterizacao_do_dsei_3"
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.text     "analise_situacional_4"
    t.text     "principais_desafios_4_2"
    t.integer  "dsei_id"
    t.text     "resultados_esperados_introducao_5"
  end

  add_index "pdsis", ["dsei_id"], name: "index_pdsis_on_dsei_id", using: :btree
  add_index "pdsis", ["user_id"], name: "index_pdsis_on_user_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.integer  "dsei_id"
    t.string   "name"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "location"
    t.string   "bond"
    t.boolean  "is_sesai_central", default: false
    t.integer  "user_id"
  end

  add_index "people", ["dsei_id"], name: "index_people_on_dsei_id", using: :btree

  create_table "physiographic_data_ethnicities", force: :cascade do |t|
    t.integer  "ethnicity_id"
    t.integer  "physiographic_data_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "physiographic_data_ethnicities", ["ethnicity_id"], name: "index_physiographic_data_ethnicities_on_ethnicity_id", using: :btree
  add_index "physiographic_data_ethnicities", ["physiographic_data_id"], name: "index_physiographic_data_ethnicities_on_physiographic_data_id", using: :btree

  create_table "physiographic_data_languages", force: :cascade do |t|
    t.integer  "physiographic_data_id"
    t.string   "language"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "physiographic_data_languages", ["physiographic_data_id"], name: "index_physiographic_data_languages_on_physiographic_data_id", using: :btree

  create_table "physiographic_datas", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "village_id"
    t.string   "pt_fluency"
    t.integer  "m_1"
    t.integer  "m_1_4"
    t.integer  "m_5_9"
    t.integer  "m_10_49"
    t.integer  "m_50_59"
    t.integer  "m_60"
    t.integer  "w_1"
    t.integer  "w_1_4"
    t.integer  "w_5_9"
    t.integer  "w_10_49"
    t.integer  "w_50_59"
    t.integer  "w_60"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "city_name"
    t.integer  "village_population"
  end

  add_index "physiographic_datas", ["pdsi_id"], name: "index_physiographic_datas_on_pdsi_id", using: :btree
  add_index "physiographic_datas", ["village_id"], name: "index_physiographic_datas_on_village_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projection_budget_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projection_budget_items", force: :cascade do |t|
    t.integer  "projection_budget_category_id"
    t.string   "name"
    t.decimal  "unit_value"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "projection_budget_items", ["projection_budget_category_id"], name: "index_projection_budget_items_on_projection_budget_category_id", using: :btree

  create_table "projection_budget_structures", force: :cascade do |t|
    t.integer  "projection_budget_year_id"
    t.integer  "type"
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "projection_budget_structures", ["projection_budget_year_id"], name: "index_projection_budget_structures_on_projection_budget_year_id", using: :btree

  create_table "projection_budget_years", force: :cascade do |t|
    t.integer  "projection_budget_id"
    t.integer  "year"
    t.integer  "quantidade_estimada"
    t.decimal  "valor_unitario"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "projection_budget_years", ["projection_budget_id"], name: "index_projection_budget_years_on_projection_budget_id", using: :btree

  create_table "projection_budgets", force: :cascade do |t|
    t.integer  "projection_budget_item_id"
    t.integer  "pdsi_id"
    t.integer  "quantidade_atual"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "projection_budgets", ["pdsi_id"], name: "index_projection_budgets_on_pdsi_id", using: :btree
  add_index "projection_budgets", ["projection_budget_item_id"], name: "index_projection_budgets_on_projection_budget_item_id", using: :btree

  create_table "responsabilities", force: :cascade do |t|
    t.integer  "pdsi_id"
    t.integer  "result_id"
    t.integer  "parent_id"
    t.integer  "person_id"
    t.integer  "responsability_level_id"
    t.date     "deadline"
    t.text     "external_actors"
    t.text     "comments"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
    t.date     "initial_date"
    t.integer  "order"
  end

  add_index "responsabilities", ["parent_id"], name: "index_responsabilities_on_parent_id", using: :btree
  add_index "responsabilities", ["pdsi_id"], name: "index_responsabilities_on_pdsi_id", using: :btree
  add_index "responsabilities", ["person_id"], name: "index_responsabilities_on_person_id", using: :btree
  add_index "responsabilities", ["responsability_level_id"], name: "index_responsabilities_on_responsability_level_id", using: :btree
  add_index "responsabilities", ["result_id"], name: "index_responsabilities_on_result_id", using: :btree

  create_table "responsability_comments", force: :cascade do |t|
    t.integer  "responsability_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "users",             default: "[]"
  end

  add_index "responsability_comments", ["responsability_id"], name: "index_responsability_comments_on_responsability_id", using: :btree
  add_index "responsability_comments", ["user_id"], name: "index_responsability_comments_on_user_id", using: :btree

  create_table "responsability_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_axes", force: :cascade do |t|
    t.string   "name"
    t.string   "section_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "result_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_strategies", force: :cascade do |t|
    t.integer  "result_axis_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "result_strategies", ["result_axis_id"], name: "index_result_strategies_on_result_axis_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.integer  "result_level_id"
    t.integer  "result_strategy_id"
    t.string   "name"
    t.boolean  "is_specific"
    t.boolean  "is_percentage"
    t.text     "result_text"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_boolean",          default: false
    t.integer  "value_2016"
    t.integer  "value_2017"
    t.integer  "value_2018"
    t.integer  "value_2019"
    t.text     "orientacoes_dsei"
    t.text     "orientacoes_sistema"
    t.integer  "value_global"
  end

  add_index "results", ["result_level_id"], name: "index_results_on_result_level_id", using: :btree
  add_index "results", ["result_strategy_id"], name: "index_results_on_result_strategy_id", using: :btree

  create_table "service_network_cities", force: :cascade do |t|
    t.integer  "service_network_id"
    t.string   "city_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_network_cities", ["service_network_id"], name: "index_service_network_cities_on_service_network_id", using: :btree

  create_table "service_networks", force: :cascade do |t|
    t.integer  "base_polo_id"
    t.integer  "pdsi_id"
    t.string   "city_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "service_networks", ["base_polo_id"], name: "index_service_networks_on_base_polo_id", using: :btree
  add_index "service_networks", ["pdsi_id"], name: "index_service_networks_on_pdsi_id", using: :btree

  create_table "specific_absolute_data", force: :cascade do |t|
    t.integer  "absolute_datum_id"
    t.integer  "dsei_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "specific_absolute_data", ["absolute_datum_id"], name: "index_specific_absolute_data_on_absolute_datum_id", using: :btree
  add_index "specific_absolute_data", ["dsei_id"], name: "index_specific_absolute_data_on_dsei_id", using: :btree

  create_table "specific_results", force: :cascade do |t|
    t.integer  "result_id"
    t.integer  "dsei_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "text_2016"
    t.text     "text_2017"
    t.text     "text_2018"
    t.text     "text_2019"
  end

  add_index "specific_results", ["dsei_id"], name: "index_specific_results_on_dsei_id", using: :btree
  add_index "specific_results", ["result_id"], name: "index_specific_results_on_result_id", using: :btree

  create_table "text_templates", force: :cascade do |t|
    t.text     "introducao_1"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "processo_construcao_pdsi_2"
    t.text     "analise_situacional_4"
  end

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
    t.integer  "dsei_id"
  end

  add_index "users", ["dsei_id"], name: "index_users_on_dsei_id", using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "villages", force: :cascade do |t|
    t.integer  "base_polo_id"
    t.string   "name",          null: false
    t.integer  "sesai_id",      null: false
    t.string   "city_name",     null: false
    t.integer  "city_sesai_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "villages", ["base_polo_id"], name: "index_villages_on_base_polo_id", using: :btree

  add_foreign_key "absolute_data", "absolute_datum_levels"
  add_foreign_key "absolute_data_base_polos", "absolute_data"
  add_foreign_key "absolute_data_base_polos", "base_polos"
  add_foreign_key "absolute_data_base_polos", "pdsis"
  add_foreign_key "absolute_data_casais", "absolute_data"
  add_foreign_key "absolute_data_casais", "casais"
  add_foreign_key "absolute_data_casais", "pdsis"
  add_foreign_key "absolute_data_dseis", "absolute_data"
  add_foreign_key "absolute_data_dseis", "dseis"
  add_foreign_key "absolute_data_dseis", "pdsis"
  add_foreign_key "base_polos", "dseis"
  add_foreign_key "budget_forecast_comments", "budget_forecasts"
  add_foreign_key "budget_forecast_comments", "users"
  add_foreign_key "budget_forecasts", "costs"
  add_foreign_key "budget_forecasts", "pdsis"
  add_foreign_key "budget_investments", "investments"
  add_foreign_key "budget_investments", "pdsis"
  add_foreign_key "capai_villages", "capais"
  add_foreign_key "capai_villages", "villages"
  add_foreign_key "capais", "pdsis"
  add_foreign_key "casais", "dseis"
  add_foreign_key "category_budgets", "pdsis"
  add_foreign_key "category_budgets", "projection_budget_categories"
  add_foreign_key "corresponsabilities", "people"
  add_foreign_key "corresponsabilities", "responsabilities"
  add_foreign_key "cost_users", "costs"
  add_foreign_key "cost_users", "users"
  add_foreign_key "costs", "costs", column: "parent_id"
  add_foreign_key "demographic_datas", "pdsis"
  add_foreign_key "destinations", "destination_types"
  add_foreign_key "destinations", "pdsis"
  add_foreign_key "destinations", "villages", column: "destination_village_id"
  add_foreign_key "destinations", "villages", column: "origin_village_id"
  add_foreign_key "emsis", "base_polos"
  add_foreign_key "emsis", "pdsis"
  add_foreign_key "ethnicities_villages", "ethnicities"
  add_foreign_key "ethnicities_villages", "villages"
  add_foreign_key "etnias", "demographic_datas"
  add_foreign_key "false_results", "dseis"
  add_foreign_key "false_results", "results"
  add_foreign_key "health_establishments", "service_network_cities"
  add_foreign_key "health_specializeds", "service_network_cities"
  add_foreign_key "infrastructure_buildings", "infrastructure_building_types"
  add_foreign_key "infrastructure_buildings", "pdsis"
  add_foreign_key "infrastructure_buildings", "villages"
  add_foreign_key "infrastructure_sanitations", "pdsis"
  add_foreign_key "infrastructure_sanitations", "villages"
  add_foreign_key "investment_items", "budget_investments"
  add_foreign_key "investments", "investments", column: "parent_id"
  add_foreign_key "pdsi_attached_files", "pdsis"
  add_foreign_key "pdsi_base_polo_data", "base_polos"
  add_foreign_key "pdsi_base_polo_data", "pdsis"
  add_foreign_key "pdsi_costs", "costs"
  add_foreign_key "pdsi_costs", "pdsis"
  add_foreign_key "pdsi_human_resources", "human_resource_functions"
  add_foreign_key "pdsi_human_resources", "pdsis"
  add_foreign_key "pdsi_need_costs", "costs"
  add_foreign_key "pdsi_need_costs", "pdsis"
  add_foreign_key "pdsi_need_investiments", "pdsis"
  add_foreign_key "pdsi_need_investiments", "projection_budget_items"
  add_foreign_key "pdsi_results", "pdsis"
  add_foreign_key "pdsi_results", "results"
  add_foreign_key "pdsis", "dseis"
  add_foreign_key "pdsis", "users"
  add_foreign_key "people", "dseis"
  add_foreign_key "people", "users"
  add_foreign_key "physiographic_data_ethnicities", "ethnicities"
  add_foreign_key "physiographic_data_ethnicities", "physiographic_datas"
  add_foreign_key "physiographic_data_languages", "physiographic_datas"
  add_foreign_key "physiographic_datas", "pdsis"
  add_foreign_key "physiographic_datas", "villages"
  add_foreign_key "profiles", "users"
  add_foreign_key "projection_budget_items", "projection_budget_categories"
  add_foreign_key "projection_budget_structures", "projection_budget_years"
  add_foreign_key "projection_budget_years", "projection_budgets"
  add_foreign_key "projection_budgets", "pdsis"
  add_foreign_key "projection_budgets", "projection_budget_items"
  add_foreign_key "responsabilities", "pdsis"
  add_foreign_key "responsabilities", "people"
  add_foreign_key "responsabilities", "responsabilities", column: "parent_id"
  add_foreign_key "responsabilities", "responsability_levels"
  add_foreign_key "responsabilities", "results"
  add_foreign_key "responsability_comments", "responsabilities"
  add_foreign_key "responsability_comments", "users"
  add_foreign_key "result_strategies", "result_axes"
  add_foreign_key "results", "result_levels"
  add_foreign_key "results", "result_strategies"
  add_foreign_key "service_network_cities", "service_networks"
  add_foreign_key "service_networks", "base_polos"
  add_foreign_key "service_networks", "pdsis"
  add_foreign_key "specific_absolute_data", "absolute_data"
  add_foreign_key "specific_absolute_data", "dseis"
  add_foreign_key "specific_results", "dseis"
  add_foreign_key "specific_results", "results"
  add_foreign_key "users", "dseis"
  add_foreign_key "villages", "base_polos"
end
