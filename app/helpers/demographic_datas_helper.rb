module DemographicDatasHelper
  def has_transportation(obj, attr)
    response  = eval "obj.#{attr}"

    icon  = response ? 'check' : 'close'
    str   = response ? 'sim' : 'não'

    "&nbsp; <i class='fa fa-#{icon}'></i> #{str}"
  end

  def ethnicity_name(id)
    Ethnicity.find(id).name
  end
end
