class PdsiNeedCost < ActiveRecord::Base
  belongs_to :cost
  belongs_to :pdsi

  def deficit_quantitativo
    return 0 if previsao_orcamentaria_2015.nil? || orcamento_necessario.nil?
    previsao_orcamentaria_2015 - orcamento_necessario
  end

  def percentual_cobertura
    return 0 if previsao_orcamentaria_2015.nil? || orcamento_necessario.nil?
    (previsao_orcamentaria_2015.to_f / orcamento_necessario.to_f) * 100
  end
end
