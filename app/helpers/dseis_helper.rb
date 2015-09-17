module DseisHelper
  def select_village_from_dsei(dsei, field_name, field_value)

    opts  = select_opts(dsei)
    return select_tag field_name, options_for_select(opts, field_value), include_blank: true
  end

  def select_opts(dsei)
    debug "begin"
    opts  = []
    dsei.villages.each do |key, value|
      values  = []
      value[:villages].each { |id, name| values << [name, id] }
      opts << [value[:name], values]
    end

    grouped_options_for_select(opts)
  end
end
