module SanitationHelper
  def village_with_sanitation(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      sum += vl.infrastructure_sanitations.count
    end
    sum
  end

  def village_alternative_supply(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.abastecimento_agua_alternativo
      end
    end
    sum
  end

  def village_complete_saa(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.saa_completo
      end
    end
    sum
  end

  def village_with_mqa(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.abastecimento_mqa
      end
    end
    sum
  end

  def village_saa_suport(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.saa_manutencao
      end
    end
    sum
  end

  def village_qtd_msd_individual(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.qtd_msd_individual
      end
    end
    sum
  end

  def village_qtd_msd_coletiva(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.qtd_msd_coletiva
      end
    end
    sum
  end

  def village_esgotamento_sanitario(base_pole)
    sum = 0
    base_pole.villages_with_sanitations.each do |vl|
      vl.infrastructure_sanitations.each do |is|
        sum += 1 if is.esgotamento_sanitario
      end
    end
    sum
  end
end
