module DseisHelper
  def select_city_from_dsei(f, dsei, field_name, field_value)
    f.select field_name, options_for_select(dsei.cities, field_value), include_blank: false
  end

  def select_village_from_dsei(f, dsei, field_name, field_value)
    opts = select_village_opts(dsei, field_value)
    f.select field_name, opts, include_blank: false
  end

  def select_person_from_dsei(f, dsei, field_name, field_value)
    response = '<div>'
    response += "  <a class='add_person button pull-right' href='#' onclick='return false;'>"
    response += icon('plus')
    response += '  </a>'
    response += f.collection_select(field_name, dsei.people.order(:name), :id, :name, { prompt: true }, { class: 'select-dsei-person' })
    response += '</div>'

    response.html_safe
  end

  def select_village_opts(dsei, field_value)
    opts = []
    dsei.villages.each do |_, value|
      values = []
      value[:villages].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts, field_value)
  end

  def select_person_opts(dsei, field_value)
    opts = []
    dsei.people.each do |_, value|
      values = []
      value[:people].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts, field_value)
  end

  def selected_villages_cities(base_polo)
    names = []
    base_polo.villages.each { |vl| names << [vl.name, vl.id] }
    names
  end
end
