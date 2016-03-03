module EmsiHelper
  def rename_emsi(base_polo)
    base_polo.emsis.each_with_index do |emsi, i|
      name = "EMSI #{emsi.base_polo_id}.#{i + 1}"
      emsi.name = name
      emsi.save
    end
  end
end
