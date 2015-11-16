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
      mapa: '3.1. Mapa',
      dados_fisiograficos: '3.1. Dados fisiográficos',
      destinos: '3.2. Meios de Transporte',
      recursos_humanos: '3.2. Dimensionamento da força de trabalho',
      capacidade_instalada: '3.2. Capacidade Instalada',
      rede_servicos: '3.2. Rede de serviços',
      infraestrutura_edificacoes: '3.2. Infraestrutura de saúde edificações',
      infraestrutura_saneamento:  '3.2. Infraestrutura de saúde - Saneamento',
      capais:        '3.2. CAPAIs',
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
      anexos: 'Anexos',
    }[section.to_sym]
  end
end
