module DemographicDatasHelper
  def has_transportation(obj, attr)
    response  = eval "obj.#{attr}"

    icon  = response ? 'check' : 'close'
    str   = response ? 'sim' : 'não'

    "&nbsp; <i class='fa fa-#{icon}'></i> #{str}"
  end

  def has_transportation_print(obj, attr)
    response  = eval "obj.#{attr}"

    str   = response ? "#{attr}" : ' '
    
    "#{str.capitalize} "
  end

  def ethnicity_name(id)
    Ethnicity.find(id).name
  end

  def select_city_name(city_string)
    City
      .find(city_string.to_i)
      .city unless city_string.nil? || city_string.empty?
  end

  def select_city_id(city_string)
    City
      .find(city_string.to_i)
      .id unless city_string.nil? || city_string.empty?
  end
end
