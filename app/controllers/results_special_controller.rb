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

  private

    def set_pdsi
      @dsei = current_dsei
      @pdsi = current_dsei.pdsi
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