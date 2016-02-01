class PdsisController < ApplicationController
  before_action :set_section,     only: [:index, :edit, :edit_category_budgets, :update, :health_indicators]
  before_action :set_pdsi
  before_action :set_base_polo,   only: [:edit, :health_indicators, :update]
  before_action :set_subsection,  only: [:edit, :edit_category_budgets, :health_indicators, :update]

  # GET /pdsis
  def index
  end

  # GET /pdsis/1
  def show
  end

  def edit
  end

  def edit_category_budgets
    render :edit
  end

  def health_indicators
    if @subsection == 'casai'
      if params.key?(:casai)
        @casai = Casai.find params[:casai]
      else
        @casai = @dsei.casais.order(:id).first
        @casai = Casai.new(dsei: @dsei) if @casai.nil?
      end
    end

    render :edit
  end

  # Add new budget_forecast to all PDSIs by new cost
  def new_budget_forecast_by_cost
    logger.debug "Huh?"
    prepare_int = (Cost.last.id+1).to_s
    @new_cost = Cost.create(id: (Cost.last.id+1), parent_id: params['parent_id'], cost_type: params['cost_type'], data_type: 'money', name: "Novo custo #{prepare_int}")
    # Each PDSI for ID
    Pdsi.all.each do |pfi|
      new_budget_forecast = BudgetForecast.create(id: (BudgetForecast.last.id+1), cost_id: @new_cost.id, pdsi_id: pfi.id)
    end
    bf = BudgetForecast.where(pdsi_id: params[:id], cost_id: @new_cost.id).take
    bfcount = BudgetForecast.where(pdsi_id: params[:id]).count
    bfcount = bfcount-1
    response = { status: true, id: bf.id, bfcount: bfcount, cost_id: @new_cost.id }
    render json: response
  end

  def update_cost_name
    @cost = Cost.find(params['cost_id'])
    @cost.name = params['cost_name']
    if @cost.save
      response = { status: true }
    else
      response = { status: false }
    end
    render json: response
  end

  def update
    if @pdsi.update(pdsi_params)
      redirect_after_save
    else
      render :edit
    end
  end

  def delete_map
    @pdsi.update map: nil
    notice  = { notice: 'Mapa excluído com sucesso.' }
    args    = { section: 'mapa' }

    redirect_to edit_pdsi_path(@pdsi, args), notice
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pdsi
    if @section.to_s[-5,5] == 'sesai'
      # Do nothing
    elsif @section == 'dotacao_orcamentaria'
      @pdsi = Pdsi.find params[:id]
      @demographic_data = @pdsi.demographic_data
      @dsei             = current_dsei
    else
      @pdsi = current_dsei.pdsi
      @demographic_data = @pdsi.demographic_data
      @dsei             = current_dsei
    end
  end

  def set_section
    section = params[:section] || 'introducao'
    @section_url  = section.gsub(/_/, '-')
    @section      = section.gsub(/-/, '_')
  end

  def set_subsection
    @subsection = params[:subsection].gsub(/-/, '_') if params.key?(:subsection)
    @tab        = params[:tab].gsub(/-/, '_') if params.key?(:tab)
  end

  def set_base_polo
    # helper allowed_sections
    if view_context.allowed_sections.include? params[:section]
      id = params[:base_polo] || @dsei.base_polos.order(:id).first.id
      @base_polo = BasePolo.find id
    end
  end

  def redirect_after_save
    return redirect_to_indicadores if params[:section] == 'indicadores-saude-indigena'

    notice = { notice: 'Dados atualizados com sucesso.' }

    args = { section: params[:section] }
    args.merge!(base_polo: params[:base_polo]) if params[:base_polo]
    args.merge!(subsection: params[:subsection]) if params[:subsection]
    args.merge!(tab: params[:tab]) if params[:tab]

    redirect_to edit_pdsi_path(@pdsi, args), notice
  end

  def redirect_to_indicadores
    notice = {notice: 'Indicadores atualizados com sucesso.'}

    args = { subsection: params[:subsection] }
    args.merge!(base_polo: params[:base_polo]) if params[:base_polo]
    args.merge!(casai: params[:casai]) if params[:casai]

    redirect_to health_indicators_path(@pdsi, args), notice
  end

  # Only allow a trusted parameter "white list" through.
  def pdsi_params
    params.require(:pdsi).permit(
      :user_id, :processo_construcao_pdsi_2, :caracterizacao_do_dsei_3, :map,
      :analise_situacional_4, :principais_desafios_4_2, :resultados_esperados_introducao_5,
      costs_atributes: [:id, :name, :parent_id, :cost_type, :data_type],
      pdsi_base_polo_data_attributes: [:id, :base_polo_id, :city_name],
      physiographic_datas_attributes: [
        :id, :pdsi_id, :village_id, :pt_fluency, :m_1, :m_1_4, :m_5_9, :m_10_49,
        :m_50_59, :m_60, :w_1, :w_1_4, :w_5_9, :w_10_49, :w_50_59, :w_60,
        :city_name, :village_population,
        physiographic_data_ethnicities_attributes: [:id, :physiographic_data_id, :ethnicity_id, :_destroy],
        physiographic_data_languages_attributes: [:id, :physiographic_data_id, :language, :_destroy]
      ],
      emsis_attributes: [:id, :name, :base_polo_id, :pdsi_id, :numero_medicos, :numero_enfermeiros, :numero_odontologistas, :numero_tecnicos_enfermagem, :asb, :ais, :aisan, :aldeias_atendidas, :permanencia_medicos, :permanencia_enfermeiros, :permanencia_odontologistas, :permanencia_tecnicos_enfermagem, :permanencia_asb, :_destroy],
      service_networks_attributes: [
        :id, :base_polo_id, :pdsi_id, :city_name,
        service_network_cities_attributes: [
          :id, :city_name, :_destroy,
          health_establishments_attributes:  [:id, :service_network_id, :name, :_destroy],
          health_specializeds_attributes:    [:id, :service_network_id, :name, :_destroy]
        ],
      ],
      infrastructure_buildings_attributes: [
        :id, :infrastructure_building_type_id, :name, :uf, :city_name, :village_id, :cnes, :building_status, :ground_status, :_destroy
      ],
      infrastructure_sanitations_attributes: [
        :id, :village_id, :abastecimento_agua, :abastecimento_agua_alternativo, :saa_completo, :nome_saa, :tipo_captacao_agua, :nome_concessionaria, :tipo_tratamento_agua, :abastecimento_mqa, :saa_manutencao, :qtd_msd_individual, :qtd_msd_coletiva, :esgotamento_sanitario, :_destroy, :base_polo_id
      ],
      capais_attributes: [
        :id, :pdsi_id, :city_name, :uf, :capai_type, :host_capacity, :_destroy, :name,
        capai_villages_attributes: [:id, :capai_id, :village_id, :_destroy],
      ],
      destinations_attributes: [:id, :pdsi_id, :origin_village_id, :destination_village_id, :destination_type_id, :boat_time, :road_time, :fly_time, :_destroy, :destination_class, :city_name, :total_time],
      pdsi_human_resources_attributes: [:id, :human_resource_function_id, :ubsi_atual, :polo_base_tipo_1_atual, :polo_base_tipo_2, :casai_atual, :sead_atual, :selog_atual, :sesane_atual, :seofi_atual, :sgep_atual, :gabinete_atual, :diasi_atual, :sesai_dsei, :municipio, :estado, :convenio, :mais_medicos, :terceirizacao, :ubsi_necessaria, :polo_base_tipo_1_necessaria, :polo_base_tipo_2_necessaria, :casai_necessaria, :sead_necessaria, :selog_necessaria, :sesane_necessaria, :seofi_necessaria, :sgep_necessaria, :gabinete_necessaria, :diasi_necessaria, :_destroy],
      absolute_data_base_polos_attributes: [:id, :absolute_datum_id, :base_polo_id, :pdsi_id, :value],
      absolute_data_dseis_attributes: [:id, :absolute_datum_id, :dsei_id, :pdsi_id, :value],
      absolute_data_casais_attributes: [:id, :absolute_datum_id, :dsei_id, :pdsi_id, :value],
      results_attributes: [:id, false_results_attributes: [:id, :dsei_id]],
      pdsi_results_attributes: [:id, :value_2016, :value_2017, :value_2018, :value_2019],
      category_budgets_attributes: [:id, :projection_budget_category_id, :value_2016, :value_2017, :value_2018, :value_2019],
      projection_budgets_attributes: [
        :id, :quantidade_atual,
        projection_budget_years_attributes: [
          :id, :year, :quantidade_estimada, :valor_unitario,
          projection_budget_structures_attributes: [:id, :name, :_destroy]
        ],
      ],
      pdsi_costs_attributes: [
        :id, :cost_id, :previsao_orcamentaria_2015, :orcamento_necessario, :dotacao_orcamentaria_inicial
      ],
      responsabilities_attributes: [
        :id, :result_id, :person_id, :deadline, :external_actors, :comments, :_destroy,
        corresponsabilities_attributes: [:id, :person_id, :_destroy],
        children_attributes: [
          :id, :result_id, :name, :person_id, :deadline, :external_actors, :comments, :_destroy,
          corresponsabilities_attributes: [:id, :person_id, :_destroy],
            children_attributes: [
              :id, :result_id, :name, :person_id, :deadline, :external_actors, :comments, :_destroy,
              corresponsabilities_attributes: [:id, :person_id, :_destroy],
            ],
        ],
      ],
      pdsi_need_costs_attributes: [
        :id, :cost_id, :previsao_orcamentaria_2015, :previsao_orcamentaria_2016, :orcamento_necessario, :orcamento_necessario_pleno
      ],
      pdsi_need_investiments_attributes: [
        :id, :projection_budget_item_id, :qtde_existente_2015, :qtde_necessaria, :valor_unitario_medio, :previsao_orcamentaria
      ],
      pdsi_attached_files_attributes: [
        :id, :name, :file
      ],
      budget_forecasts_attributes: [
        :id, :reference_forecast, :budget_forecast,
        :initial_forecast_2016, :dsei_forecast_2016, :revised_forecast_2016,
        :initial_forecast_2017, :dsei_forecast_2017, :revised_forecast_2017,
        :initial_forecast_2018, :dsei_forecast_2018, :revised_forecast_2018,
        :initial_forecast_2019, :dsei_forecast_2019, :revised_forecast_2019,
      ],
      budget_investments_attributes: [
        :id, :quantity_2016, :quantity_2017, :quantity_2018, :quantity_2019,
        :unitary_amount_2016, :unitary_amount_2017, :unitary_amount_2018, :unitary_amount_2019,
        :forecast_amount_2016, :forecast_amount_2017, :forecast_amount_2018, :forecast_amount_2019,
        investment_items_attributes: [:id, :_destroy, :name, :quantity_2016, :unitary_amount_2016,
         :forecast_amount_2016, :quantity_2017, :unitary_amount_2017, :forecast_amount_2017,
         :quantity_2018, :unitary_amount_2018, :forecast_amount_2018, :quantity_2019,
         :unitary_amount_2019, :forecast_amount_2019, :year_reference, :city,
         :pole_base, :village
        ]
      ],
      people_attributes: [ :id, :_destroy, :name, :indigenous_worker,
                           :professional_category, :role, :bond_type, :bond, :workplace, :location ]
    )
  end
end


