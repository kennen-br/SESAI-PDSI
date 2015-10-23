class SpecificResultsController < ApplicationController
  before_action :set_pdsi

  def edit
  end

  def update
    if @dsei.update(dsei_params)


      @dsei.results.each do |result|
        PdsiResult.where(pdsi: @pdsi, result: result ).first_or_create do |pdsi_result|
          pdsi_result.value_2016 = result.value_2016
          pdsi_result.value_2017 = result.value_2017
          pdsi_result.value_2018 = result.value_2018
          pdsi_result.value_2019 = result.value_2019
        end
      end

      args = { section: params[:section] }
      args.merge!(tab: params[:tab]) if params[:tab]

      redirect_to edit_specific_results_path(@pdsi, args), { notice: 'Resutlados Específicos salvos com sucesso.'}
    else
      render :edit
    end
  end

  private

    def set_pdsi
      @dsei = current_dsei
      @pdsi = @dsei.pdsi
    end

    def dsei_params
      params.require(:dsei).permit(
        :id,
        results_attributes: [:id, :result_strategy_id, :result_level_id, :result_text, :is_specific, :name, :orientacoes_dsei, :is_boolean, :value_2016, :value_2017, :value_2018, :value_2019]
      )
    end

end
