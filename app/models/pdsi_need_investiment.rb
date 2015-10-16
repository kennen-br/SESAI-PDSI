class PdsiNeedInvestiment < ActiveRecord::Base
  belongs_to :projection_budget_item
  belongs_to :pdsi

  def deficit_quantitativo
    return 0 if qtde_existente_2015.nil? || qtde_necessaria.nil?
    qtde_existente_2015 - qtde_necessaria
  end

  def percentual_cobertura
    return 0 if qtde_existente_2015.nil? || qtde_necessaria.nil?
    (qtde_existente_2015.to_f / qtde_necessaria.to_f) * 100
  end

  def estimativa_necessario
    (valor_unitario_medio || 1) * deficit_quantitativo.abs
  end
end
