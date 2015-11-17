class ResultsSpecialController < ApplicationController
  before_action :set_pdsi

  # GET /meu-pdsi/:id/resultados-esperados
  def index
  end

  def update
    if @pdsi.update(pdsi_params)
      response = { status: true }
    else
      field = "#{params[:relation]}.#{params[:field]}".to_sym
      response = { status: false, message:  @pdsi.errors.get(field).join('<br>').humanize }
    end
    render json: response
  end

  def loop
    hash = loop_params
    klass = Object.const_get hash['class']
    object = klass.where(hash['values']).first_or_create

    render json: object.to_json
  end

  def responsability
    level = ResponsabilityLevel.find_by_name params['level']
    @klass = params['level'] == 'Produto' ? 'product' : 'action'
    @responsability = Responsability.create(responsability_level: level, parent_id: params['parent_id'])
    render layout: false
  end

  def false_result
    values = false_result_params
    false_result = FalseResult.where(dsei_id: values['dsei_id'], result_id: values['result_id'])
    if values['not_apply'] == 'true'
      false_result.first_or_create
      response = { status: 'created' }
    else
      false_result.first.destroy
      response = { status: 'deleted' }
    end
    render json: response
  end

  def new_comment
    values = new_comment_params
    @comment = ResponsabilityComment.create(responsability_id: values['resp_id'], comment: values['comment'], user: current_user)
    render layout: false
  end

  def delete
    values = delete_params
    if Responsability.find(values['resp_id']).destroy
      response = { status: true }
    else
      response = { status: false }
    end

    render json: response
  end

  def link_product
    values = link_product_params
    product = Responsability.find(values['product_id'])
    @responsability = product.amoeba_dup

    result = Result.find(values['result_id'])
    result_resp = result.responsability_result

    @responsability.parent_id = result_resp.id
    @responsability.save

    @klass          = 'product'
    params['level'] = 'Produto'

    render 'responsability', layout: false
  end

  def specific_result
    values = specific_result_params

    # Creates the Result and make it Specific
    level  = ResultLevel.find_by_name('DSEI')
    result = Result.create({
      result_level: level,
      result_strategy_id: values['strategy'],
      name: values['name'],
      result_text: values['text'],
      is_specific: true,
      value_2016: 0,
      value_2017: 0,
      value_2018: 0,
      value_2019: 0
    })
    SpecificResult.create({
      result: result,
      dsei: @dsei,
      text_2016: values['text'],
      text_2017: values['text'],
      text_2018: values['text'],
      text_2019: values['text']
    })

    # Creates the Result Responsability for the result
    level = ResponsabilityLevel.find_by_name('Resultado')
    Responsability.create result: result, responsability_level: level, pdsi: @pdsi

    # Creates the PdsiResult
    @pdsi_result = PdsiResult.create({
      pdsi: @pdsi,
      result: result,
      value_2016: 0,
      value_2017: 0,
      value_2018: 0,
      value_2019: 0
    })
    render layout: false
  end

  def specific_update
    values = specific_result_params

    result = Result.find(values['result_id'])

    if values['field'].include? 'value_'
      result.update(values['field'].to_sym => values['value'])
      result.pdsi_results.where(pdsi: @pdsi).first.update(values['field'].to_sym => values['value'])
    else
      result.dsei_specific_result(@dsei).update(values['field'].to_sym => values['value'])
    end

    render json: {status: true}
  end

  def products_order
    params['order'].each do |item|
      values = item[1]
      Responsability.find(values['id']).update(order: values['order'])
    end
    render json: { status: true }
  end

  private

    def set_pdsi
      @dsei = current_dsei
      @pdsi = current_dsei.pdsi
    end

    def specific_result_params
      params.require(:specific_result).permit(:name, :text, :strategy, :field, :value, :result_id)
    end

    def link_product_params
      params.require(:link_product).permit(:product_id, :result_id)
    end

    def delete_params
      params.require(:delete).permit(:resp_id)
    end

    def new_comment_params
      params.require(:comment).permit(:resp_id, :comment)
    end

    def false_result_params
      params.require(:false_result).permit(:result_id, :dsei_id, :not_apply)
    end

    def loop_params
      values = params['item']['values']
      keys = []
      values.each { |k,v| keys << k }
      params.require(:item).permit(:class, values: keys).to_h
    end

    def pdsi_params
      params.permit(
        pdsi_results_attributes: [:id, :value_2016, :value_2017, :value_2018, :value_2019],
        responsabilities_attributes: [
          :id, :result_id, :name, :person_id, :initial_date, :deadline, :external_actors, :comments, :_destroy,
          corresponsabilities_attributes: [:id, :person_id, :_destroy],
          children_attributes: [
            :id, :result_id, :name, :person_id, :initial_date, :deadline, :external_actors, :comments, :_destroy,
            corresponsabilities_attributes: [:id, :person_id, :_destroy],
              children_attributes: [
                :id, :result_id, :name, :person_id, :initial_date, :deadline, :external_actors, :comments, :_destroy,
                corresponsabilities_attributes: [:id, :person_id, :_destroy],
              ],
          ],
        ],
      )
    end
end
