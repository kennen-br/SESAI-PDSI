module ApplicationHelper

  def breadcrumbs(links)
    render 'refills/breadcrumbs', {links: links}
  end

  def debug(data)
    data = [data] unless data.is_a?(Array)

    puts "\n\n"
    puts '#' * 100
    data.each do |item|
      p item
      puts '#' * 100
    end
    puts "\n\n"
  end

  def select_uf(field_name, field_value)
    return select_tag field_name, options_for_select(%w{ AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO }, field_value), include_blank: true
  end
end
