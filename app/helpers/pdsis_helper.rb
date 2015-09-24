module PdsisHelper

  def allowed_sections
    %w"dados-fisiograficos rede-servicos indicadores-saude-indigena"
  end

  def section_path(section)
    three = [{ name: 'Caracterização do DSEI', path: pdsis_path('caracterizacao-do-dsei')}]
    bread = [{ name: section_name(section), path: pdsis_path(section: section.gsub(/_/, '-'))}]

    if %w"mapa dados_fisiograficos destinos capacidade_instalada rede_servicos infraestrutura_edificacoes infraestrutura_saneamento capais".include? section
      three + bread
    else
      bread
    end
  end

  def section_name(section)
    {
      introducao: 'Introdução',
      processo_de_construcao_do_pdsi: 'O Processo de construção',
      # 3
      caracterizacao_do_dsei: 'Caracterização do DSEI',
      mapa: 'Mapa',
      dados_fisiograficos: 'Dados fisiográficos',
      destinos: 'Meios de Transporte',
      recursos_humanos: 'Dimensionamento da força de trabalho',
      capacidade_instalada: 'Capacidade Instalada',
      rede_servicos: 'Rede de serviços',
      infraestrutura_edificacoes: 'Infraestrutura de saúde edificações',
      infraestrutura_saneamento:  'Infraestrutura de saúde - Saneamento',
      capais:        'CAPAIs',
      # 4
      analise_situacional:        'Análise situacional',
      indicadores_saude_indigena: 'Indicadores estratégicos para a saúde indígena',
    }[section.to_sym]
  end
end
