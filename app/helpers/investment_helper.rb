module InvestmentHelper
  def village_name(village_string)
    InvestmentVillage
      .find(village_string.to_i)
      .name unless village_string.nil? || village_string.empty?
  end

  def village_id(village_string)
    InvestmentVillage
      .find(village_string.to_i)
      .id unless village_string.nil? || village_string.empty?
  end

  def city_name(city_string)
    InvestmentCity
      .find(city_string.to_i)
      .name unless city_string.nil? || city_string.empty?
  end

  def pole_base_name(pole_base_string)
    InvestmentPoleBase
      .find(pole_base_string.to_i)
      .name unless pole_base_string.nil? || pole_base_string.empty?
  end
end
