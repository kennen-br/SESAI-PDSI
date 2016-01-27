module PdsisHelper

  def allowed_sections
    %w"dados-fisiograficos destinos rede-servicos indicadores-saude-indigena destinos capacidade-instalada"
  end

  def section_path(section)
    three = [{ name: '3. Caracterização do DSEI', path: pdsis_path('caracterizacao-do-dsei')}]
    bread = [{ name: section_name(section), path: pdsis_path(section: section.gsub(/_/, '-'))}]

    if %w"mapa dados_fisiograficos destinos capacidade_instalada rede_servicos infraestrutura_edificacoes infraestrutura_saneamento capais".include? section
      three + bread
    else
      bread
    end
  end

  def section_name(section)
    {
      introducao: '1. Introdução',
      processo_de_construcao_do_pdsi: '2. O Processo de construção do PDSI',
      # 3
      caracterizacao_do_dsei: '3. Caracterização do DSEI',
      mapa: '3.1. Mapa do Território',
      dados_fisiograficos: '3.1. Dados fisiográficos',
      destinos: '3.2. Meios de Transporte',
      recursos_humanos: '3.2. Dimensionamento da força de trabalho',
      capacidade_instalada: '3.2. Capacidade Instalada',
      rede_servicos: '3.2. Rede de serviços',
      infraestrutura_edificacoes: '3.2. Infraestrutura de saúde - Edificações',
      infraestrutura_saneamento:  '3.2. Infraestrutura de saúde - Saneamento',
      capais:        '3.2. Infraestrutura de saúde - CAPAIs',
      # 4
      analise_situacional:        '4. Análise situacional',
      indicadores_saude_indigena: '4.1 Indicadores estratégicos para a saúde indígena',
      principais_desafios:        '4.2 Principais desafios a serem enfrentados em 2016-2019',
      # 5
      resultados_esperados:   '5. Resultados esperados',
      # 6
      projecao_orcamentaria:  '6. Projeção orçamentária 2016-2019',
      dotacao_orcamentaria:   '6. Dotação orçamentária',
      # 7
      anexos: '7. Anexos',
    }[section.to_sym]
  end

  def sum_human_resources(pdsi)
    sum_actual(pdsi)
    sum_needed(pdsi)
  end

  private

  def sum_needed(pdsi)
    needed = pdsi.pdsi_human_resources.select(:id,
                                              :ubsi_necessaria,
                                              :polo_base_tipo_1_necessaria,
                                              :polo_base_tipo_2_necessaria,
                                              :casai_necessaria,
                                              :sead_necessaria,
                                              :selog_necessaria,
                                              :sesane_necessaria,
                                              :sead_necessaria,
                                              :sgep_necessaria,
                                              :gabinete_necessaria,
                                              :diasi_necessaria)
    needed.all.as_json.each do |nd|
      id = nil
      nd.slice('id').values.each { |e| id = e }
      sum = nd.except('id').values.reject(&:nil?).sum
      PdsiHumanResource.find(id).update_attribute(:workforce_needed, sum)
    end
  end

  def sum_actual(pdsi)
    actual = pdsi.pdsi_human_resources.select(:id,
                                              :ubsi_atual,
                                              :polo_base_tipo_1_atual,
                                              :polo_base_tipo_2_atual,
                                              :casai_atual,
                                              :sead_atual,
                                              :selog_atual,
                                              :sesane_atual,
                                              :seofi_atual,
                                              :sgep_atual,
                                              :gabinete_atual,
                                              :diasi_atual)
    actual.all.as_json.each do |ac|
      id = nil
      ac.slice('id').values.each { |e| id = e }
      sum = ac.except('id').values.reject(&:nil?).sum
      PdsiHumanResource.find(id).update_attribute(:actual_sum, sum)
    end
  end
end
