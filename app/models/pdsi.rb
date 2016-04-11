class Pdsi < ActiveRecord::Base
  auditable

  validates :processo_construcao_pdsi_2,
            :caracterizacao_do_dsei_3,
            :map,
            :destinations,
            :quantity_of_physiographic_data,
            :service_networks,
            :infrastructure_buildings,
            :infrastructure_sanitations,
            :capais,
            :emsis,
            :responsabilities,
            presence: true, on: :pdf


  belongs_to :user
  belongs_to :dsei

  has_one :demographic_data
  accepts_nested_attributes_for :demographic_data

  has_many :physiographic_datas
  accepts_nested_attributes_for :physiographic_datas, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_base_polo_data
  accepts_nested_attributes_for :pdsi_base_polo_data, reject_if: :all_blank, allow_destroy: true

  has_many :emsis
  accepts_nested_attributes_for :emsis, reject_if: :all_blank, allow_destroy: true

  has_many :service_networks
  accepts_nested_attributes_for :service_networks, reject_if: :all_blank, allow_destroy: true

  has_many :infrastructure_buildings
  accepts_nested_attributes_for :infrastructure_buildings, reject_if: :all_blank, allow_destroy: true

  has_many :infrastructure_sanitations
  accepts_nested_attributes_for :infrastructure_sanitations, reject_if: :all_blank, allow_destroy: true

  has_many :capais
  accepts_nested_attributes_for :capais, reject_if: :all_blank, allow_destroy: true

  has_many :destinations
  accepts_nested_attributes_for :destinations, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_human_resources
  accepts_nested_attributes_for :pdsi_human_resources, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_results
  accepts_nested_attributes_for :pdsi_results, reject_if: :all_blank, allow_destroy: true
  has_many :results, through: :pdsi_results
  accepts_nested_attributes_for :results, reject_if: :all_blank, allow_destroy: true

  has_many :projection_budgets
  accepts_nested_attributes_for :projection_budgets, reject_if: :all_blank, allow_destroy: true

  has_many :category_budgets
  accepts_nested_attributes_for :category_budgets, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_costs
  accepts_nested_attributes_for :pdsi_costs, reject_if: :all_blank, allow_destroy: true

  has_many :responsabilities
  accepts_nested_attributes_for :responsabilities, reject_if: :all_blank, allow_destroy: true

  has_many  :responsability_references
  accepts_nested_attributes_for :responsabilities, reject_if: :all_blank, allow_destroy: true

  has_many  :pdsi_need_costs
  accepts_nested_attributes_for :pdsi_need_costs, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_need_investiments
  accepts_nested_attributes_for :pdsi_need_investiments, reject_if: :all_blank, allow_destroy: true

  has_many :pdsi_attached_files
  accepts_nested_attributes_for :pdsi_attached_files, reject_if: :all_blank, allow_destroy: true

  has_many :budget_forecasts
  accepts_nested_attributes_for :budget_forecasts, reject_if: :all_blank, allow_destroy: true

  has_many :budget_investments
  accepts_nested_attributes_for :budget_investments, reject_if: :all_blank, allow_destroy: true

  has_many :people
  accepts_nested_attributes_for :people, reject_if: :all_blank, allow_destroy: true

  has_many :strategic_indicators
  accepts_nested_attributes_for :strategic_indicators, reject_if: :all_blank, allow_destroy: true

  has_many :strategic_indicator_dseis
  accepts_nested_attributes_for :strategic_indicator_dseis, reject_if: :all_blank, allow_destroy: true

  has_many :strategic_indicator_casais
  accepts_nested_attributes_for :strategic_indicator_casais, reject_if: :all_blank, allow_destroy: true

  has_many :strategic_indicator_base_poles
  accepts_nested_attributes_for :strategic_indicator_base_poles, reject_if: :all_blank, allow_destroy: true

  has_attached_file :map, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/
  # validates_with AttachmentSizeValidator, attributes: :map, less_than: 2.megabytes

  attr_accessor :text_template

  def text_template
    return @text_template unless @text_template.nil?

    @text_template = TextTemplate.first
  end

  def demographic_data
    return @demographic_data unless @demographic_data.nil?

    @demographic_data = DemographicData.first_or_create pdsi: self
  end

  def sample(attr)
    eval "text_template.#{attr}"
  end

  def introducao_1
    compose_item :introducao_1, '[NOME_DSEI]', dsei.name
  end

  def compose_item_2
    return if processo_construcao_pdsi_2.blank?

    compose_item :processo_construcao_pdsi_2, '[PARAGRAFO_DSEI]', processo_construcao_pdsi_2
  end

  def compose_item_3
    caracterizacao_do_dsei_3
  end

  def compose_item_4
    compose_item :analise_situacional_4, '[NOME_DSEI]', dsei.name
  end

  def compose_item_5
    resultados_esperados_introducao_5
  end

  def destinations_with_villages
    DestinationType
      .eager_load(destinations: [:origin_village, :destination_village])
      .where('destinations.pdsi_id = ?', id)
  end

  def capais_with_villages
    Capai.eager_load(capai_villages: [:village]).where(pdsi: self)
  end

  def infrastructure_building_to_building_type(building_type)
    items = infrastructure_buildings.where(infrastructure_building_type: building_type)

    if building_type.name == 'Sede do DSEI'
      return items unless items.blank?

      item  = InfrastructureBuilding.create pdsi: self, infrastructure_building_type: building_type
      items << item
    end

    items
  end

  def strategic_indicators_dseis_with_values
    items = strategic_indicator_dseis.order(:id)
    return items.includes(strategic_indicator:
                          [:strategic_indicator_numerator,
                           :strategic_indicator_denominator]) unless items.blank?

    StrategicIndicator.where(level: 'dsei').where(data_base: 'pdsi').order(:id).each do |si|
      strategic_indicator_dseis << StrategicIndicatorDsei.new(strategic_indicator: si, dsei: dsei, pdsi: self)
    end
    save

    strategic_indicators_dseis_with_values
  end

  def strategic_indicators_casais_with_values(casai)
    items = strategic_indicator_casais.order(:id)
    return items.includes(strategic_indicator:
                          [:strategic_indicator_numerator,
                           :strategic_indicator_denominator]) unless items.blank?

    StrategicIndicator.where(level: 'casai').where(data_base: 'pdsi').order(:id).each do |si|
      strategic_indicator_casais << StrategicIndicatorCasai.new(strategic_indicator: si, casai: casai, pdsi: self)
    end
    save

    strategic_indicators_casais_with_values(casai)
  end

  def strategic_indicators_base_pole_with_values(base_polo)
    items = strategic_indicator_base_poles.order(:id)
    return items.includes(strategic_indicator:
                          [:strategic_indicator_numerator,
                           :strategic_indicator_denominator]) unless items.blank?

    StrategicIndicator.where(level: 'base_pole').where(data_base: 'pdsi').order(:id).each do |si|
      strategic_indicator_base_poles << StrategicIndicatorBasePole.new(strategic_indicator: si, base_polo: base_polo, pdsi: self)
    end
    save

    strategic_indicators_base_pole_with_values(base_polo)
  end

  def pdsi_results_to_section_with_values(section_name)
    items = pdsi_results.joins(result: [result_strategy: [:result_axis]])
                        .where('result_axes.section_name = ? AND results.result_level_id = 1', section_name)
    return items.includes(:result).order(['result_axes.id', 'result_strategies.id', 'results.id']) unless items.blank?

    ResultAxis.includes(:result_strategies).find_by_section_name(section_name).result_strategies.each do |strategy|
      return items if strategy.results.blank?
      strategy.results.each do |result|
        pdsi_results << PdsiResult.new(pdsi: self,
                                       result: result,
                                       value_2016: result.value_2016,
                                       value_2017: result.value_2017,
                                       value_2018: result.value_2018,
                                       value_2019: result.value_2019,
                                       value_global: result.value_global)
      end
    end

    save
    pdsi_results_to_section_with_values section_name
  end

  def category_budgets_with_values
    items = category_budgets
    return items.includes(:projection_budget_category) unless items.blank?

    ProjectionBudgetCategory.order(:id).each do |category|
      category_budgets << CategoryBudget.new(projection_budget_category: category, pdsi: self)
    end

    save
    category_budgets_with_values
  end

  def budgets_with_values(category)
    items = projection_budgets.joins(:projection_budget_item)
                              .where('projection_budget_items.projection_budget_category_id = ?', category.id)
    return items.includes(:projection_budget_item, projection_budget_years: [:projection_budget_structures])
                .order([:id, 'projection_budget_years.year']) unless items.blank?

    category.projection_budget_items.each do |pbi|
      item  = ProjectionBudget.new projection_budget_item: pbi
      (2015..2019).each { |year| item.projection_budget_years << ProjectionBudgetYear.new(year: year) }

      projection_budgets << item
    end

    budgets_with_values category
  end

  def costs_with_values
    return  items.includes(:cost).order(:id) unless pdsi_costs.blank?

    Cost.all.each { |cost| pdsi_costs << PdsiCost.new(cost: cost) }

    costs_with_values
  end

  def need_costs_with_values
    return  pdsi_need_costs.includes(:cost).order(:id) unless pdsi_need_costs.blank?

    Cost.all.each { |cost| pdsi_need_costs << PdsiNeedCost.new(cost: cost) }

    need_costs_with_values
  end

  def budget_forecasts_with_values
    items = budget_forecasts
    return items.includes(:cost).order(:cost_id) unless budget_forecasts.blank?

    Cost.all.each { |cost| budget_forecasts << BudgetForecast.new(cost: cost) }

    budget_forecasts_with_values
  end

  def budget_forecasts_with_values_no_child(pdsi_id)
    BudgetForecast
      .includes(:cost)
      .order(:cost_id)
      .where(['pdsi_id = :pdsi_id', pdsi_id: pdsi_id])
      .references(:budget_forecast)
      .where('parent_id IS NULL')
      .references(:cost)
  end

  def bf_with_values_children(pdsi_id, cost_id)
    BudgetForecast
      .includes(:cost)
      .order(:cost_id)
      .where(['pdsi_id = :pdsi_id', pdsi_id: pdsi_id])
      .references(:budget_forecast)
      .where(['parent_id = :cost_id', cost_id: cost_id])
      .references(:cost)
  end

  def need_investiments_with_values(category)
    items = pdsi_need_investiments.joins(:projection_budget_item)
                                  .where('projection_budget_items.projection_budget_category_id = ?', category.id)
    return items.includes(:projection_budget_item).order(:id) unless pdsi_need_investiments.blank?

    ProjectionBudgetItem.all.each do |item|
      pdsi_need_investiments << PdsiNeedInvestiment.new(projection_budget_item: item)
    end

    need_investiments_with_values(category)
  end

  def responsabilities_with_values(axis)
    level = ResponsabilityLevel.find_by_name 'Resultado'
    items = responsabilities.joins(result: [:result_strategy])
                            .where('result_strategies.result_axis_id = ? AND responsability_level_id = ?', axis.id, level.id)

    return items.includes(:children, :person, :result, :corresponsabilities).order(:id) unless items.blank?

    axis.result_strategies.each do |result_strategy|
      result_strategy.results.each do |result|
        # next unless result.parent_id.nil?
        responsabilities << Responsability.new(result_id: result.id, responsability_level: level)
      end
    end

    responsabilities_with_values axis
  end

  def budget_investments_with_values
    items = budget_investments
    return items.includes([:investment, { investment_items: :budget_investment }])
                .order(:investment_id) unless budget_investments.blank?

    Investment.all.each do |investment|
      budget_investments << BudgetInvestment.new(investment: investment)
    end

    budget_investments_with_values
  end

  def human_resources_with_values
    return pdsi_human_resources.includes(:human_resource_function) unless pdsi_human_resources.blank?

    HumanResourceFunction.all.each do |human_resource_function|
      pdsi_human_resources << PdsiHumanResource.new(human_resource_function: human_resource_function)
    end
    human_resources_with_values
  end

  def dsei_indigenous_worker
    Person.where(indigenous_worker: true).count
  end

  private

  def compose_item(sample_attr, key, value)
    default = sample(sample_attr)

    return if default.nil?

    default.gsub key, value
  end

  def quantity_of_physiographic_data
    return true if physiographic_datas.count == dsei.base_polos.map { |e| e.villages.count }.join.to_i
    false
  end
end
