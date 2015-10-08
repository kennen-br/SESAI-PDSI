module DseisHelper
  def select_village_from_dsei(f, dsei, field_name, field_value)
    opts  = select_village_opts(dsei, field_value)
    return f.select field_name, opts, include_blank: true
  end

  def select_person_from_dsei(f, dsei, field_name, field_value)
    f.collection_select(field_name, dsei.people.order(:name), :id, :name, {prompt: true})
  end

  def select_village_opts(dsei, field_value)
    opts  = []
    dsei.villages.each do |key, value|
      values  = []
      value[:villages].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts, field_value)
  end

  def select_person_opts(dsei, field_value)
    opts  = []
    dsei.people.each do |key, value|
      debug key
      values  = []
      value[:people].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts, field_value)
  end
end
