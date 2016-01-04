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

  def select_uf(f, field_name, field_value)
    f.select field_name, options_for_select(%w{ AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO }, field_value), include_blank: true
  end

  def select_dsei
    collection_select(
      'session',
      'dsei_id',
      Dsei.order(:name),
      :id,
      :name,
      { prompt: true, selected: current_dsei.id }
    )
  end

  def current_dsei
    return unless session[:dsei]
    Dsei.find session[:dsei]
  end

  def current_pdsi
    Pdsi.find session[:pdsi]
  end

  def unique_id
    Time.new.to_f.to_s.gsub(/\./, '')
  end
end
