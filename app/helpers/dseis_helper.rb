module DseisHelper
  def select_village_from_dsei(f, dsei, field_name, field_value)
    opts  = select_opts(dsei, field_value)
    return f.select field_name, opts, include_blank: true
  end

  def select_opts(dsei, field_value)
    debug "begin"
    opts  = []
    dsei.villages.each do |key, value|
      values  = []
      value[:villages].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts, field_value)
  end
end
