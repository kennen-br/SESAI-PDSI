if InfrastructureBuildingType.count == 0
    InfrastructureBuildingType.create!([
        { name: 'Sede do DSEI' },
        { name: 'CASAI' },
        { name: 'Sede de Polo Base Tipo 1' },
        { name: 'Sede de Polo Base Tipo 2' },
        { name: 'UBSI' }
    ])
end

if Dsei.count == 0
  Dsei.create!([
    {name: "ALAGOAS E SERGIPE", sesai_id:  1 },
    {name: "ALTAMIRA", sesai_id:  2 },
    {name: "ALTO RIO JURUÁ", sesai_id:  3 },
    {name: "ALTO RIO NEGRO", sesai_id:  4 },
    {name: "ALTO RIO PURUS", sesai_id:  5 },
    {name: "ALTO RIO SOLIMÕES", sesai_id:  6 },
    {name: "AMAPÁ E NORTE DO PARÁ", sesai_id:  7 },
    {name: "ARAGUAIA", sesai_id:  8 },
    {name: "BAHIA", sesai_id:  9 },
    {name: "CEARÁ", sesai_id:  10  },
    {name: "CUIABÁ", sesai_id:  11  },
    {name: "GUAMÁ-TOCANTINS", sesai_id:  12  },
    {name: "INTERIOR SUL", sesai_id:  13  },
    {name: "KAIAPÓ DO MATO GROSSO", sesai_id:  14  },
    {name: "KAIAPÓ DO PARÁ", sesai_id:  15  },
    {name: "LESTE DE RORAIMA", sesai_id:  16  },
    {name: "LITORAL SUL", sesai_id:  17  },
    {name: "MANAUS", sesai_id:  18  },
    {name: "MARANHÃO", sesai_id:  19  },
    {name: "MATO GROSSO DO SUL", sesai_id:  20  },
    {name: "MÉDIO RIO PURUS", sesai_id:  21  },
    {name: "MÉDIO RIO SOLIMÕES E AFLUENTES", sesai_id:  22  },
    {name: "MINAS GERAIS E ESPÍRITO SANTO", sesai_id:  23  },
    {name: "PARINTINS", sesai_id:  24  },
    {name: "PERNAMBUCO", sesai_id:  25  },
    {name: "PORTO VELHO", sesai_id:  26  },
    {name: "POTIGUARA", sesai_id:  27  },
    {name: "RIO TAPAJÓS", sesai_id:  28  },
    {name: "TOCANTINS", sesai_id:  29  },
    {name: "VALE DO JAVARI", sesai_id:  30  },
    {name: "VILHENA", sesai_id:  31  },
    {name: "XAVANTE", sesai_id:  32  },
    {name: "XINGU", sesai_id:  33  },
    {name: "YANOMAMI", sesai_id:  34  },
    {name: "SESAI CENTRAL", sesai_id:  35  }
  ])
end

# BasePolo Seeds
if BasePolo.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'base_polos.seed.csv')
  sql = <<-COPY_PSQL
    COPY base_polos(dsei_id, name, city_name, sesai_id, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end
# VILLAGE Seeds
if Village.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY villages(base_polo_id, name, sesai_id, city_name, city_sesai_id, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if Ethnicity.count == 0
  # ETHNICITY Seeds
  seed_path = File.join(Rails.root, 'db', 'seeds', 'ethnicities.seed.csv')
  sql = <<-COPY_PSQL
    COPY ethnicities(name , sesai_id, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)

  # ETHNICITY_VILLAGE Seeds
  seed_path = File.join(Rails.root, 'db', 'seeds', 'ethnicities_villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY ethnicities_villages(ethnicity_id, village_id)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end


# PEOPLE Seeds
if Person.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'people.seed.csv')
  sql = <<-COPY_PSQL
    COPY people(dsei_id, is_sesai_central, name, location, bond, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentPoleBase Seeds
if InvestmentPoleBase.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_pole_base.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_pole_bases(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentCity Seeds
if InvestmentCity.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_cities.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_cities(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# InvestmentVillage Seeds
if InvestmentVillage.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'investment_villages.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_villages(name, created_at, updated_at)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

# DemographicData Seeds
if DemographicData.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'demographic_data.seed.csv')
  sql = <<-COPY_PSQL
    COPY demographic_datas(pdsi_id  , extensao_territorial  , municipio_sede  , endereco  , email , numero_municipios , populacao_indigena  , etnias  , numero_polos_base , numero_sede_polos_base  , numero_ubsi , numero_regioes_de_saude , numero_casais , numero_aldeias  , numero_familias , meios_de_transporte , created_at  , updated_at  , fluvial , rodoviario  , aereo)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if UserType.count == 0
  UserType.create!([
    {name: "Administrador"},
    {name: "Visitante SESAI Central"},
    {name: "Gestor SESAI Central"},
    {name: "Visitante DSEI"},
    {name: "Gestor DSEI"},
  ])
end

if User.count == 0
  User.create!([
    #USUÁRIO ADMINISTRATIVO
    { username: "AD0001", password: 'Rapadura1234!@#$', user_type: UserType.first,           active: true, profile: Profile.new(name: 'Administrador') },
    #USUÁRIO SESAI
    { username: "US0001", password: 'Rapadura1234!@#$', user_type: UserType.second,          active: true, profile: Profile.new(name: 'Usuário de consultas da SESAI Central') },
    { username: "OS0001", password: 'Rapadura1234!@#$', user_type: UserType.first(3).last,    active: true, profile: Profile.new(name: 'Operador da SESAI Central') },
    #USUÁRIO DSEI
    { username: "UD0001", password: 'Rapadura1234!@#$', user_type: UserType.first(4).last,    active: true, profile: Profile.new(name: 'Usuário de consultas ALTO RIO JURUÁ'), dsei: Dsei.find(3) },
    #OPERADORES DSEI
    { username: "OD0001", password: 'Rapadura1234!@#$', user_type:UserType.first(5).last, active:true, profile:Profile.new(name: 'ALAGOAS E SERGIPE'), dsei: Dsei.find(1) },
    { username: "OD0002", password: 'Rapadura1234!@#$', user_type:UserType.first(6).last, active:true, profile:Profile.new(name: 'ALTAMIRA'), dsei: Dsei.find(2) },
    { username: "OD0003", password: 'Rapadura1234!@#$', user_type:UserType.first(7).last, active:true, profile:Profile.new(name: 'ALTO RIO JURUÁ'), dsei: Dsei.find(3) },
    { username: "OD0004", password: 'Rapadura1234!@#$', user_type:UserType.first(8).last, active:true, profile:Profile.new(name: 'ALTO RIO NEGRO'), dsei: Dsei.find(4) },
    { username: "OD0005", password: 'Rapadura1234!@#$', user_type:UserType.first(9).last, active:true, profile:Profile.new(name: 'ALTO RIO PURUS'), dsei: Dsei.find(5) },
    { username: "OD0006", password: 'Rapadura1234!@#$', user_type:UserType.first(10).last, active:true, profile:Profile.new(name: 'ALTO RIO SOLIMÕES'), dsei: Dsei.find(6) },
    { username: "OD0007", password: 'Rapadura1234!@#$', user_type:UserType.first(11).last, active:true, profile:Profile.new(name: 'AMAPÁ E NORTE DO PARÁ'), dsei: Dsei.find(7) },
    { username: "OD0008", password: 'Rapadura1234!@#$', user_type:UserType.first(12).last, active:true, profile:Profile.new(name: 'ARAGUAIA'), dsei: Dsei.find(8) },
    { username: "OD0009", password: 'Rapadura1234!@#$', user_type:UserType.first(13).last, active:true, profile:Profile.new(name: 'BAHIA'), dsei: Dsei.find(9) },
    { username: "OD0010", password: 'Rapadura1234!@#$', user_type:UserType.first(14).last, active:true, profile:Profile.new(name: 'CEARÁ'), dsei: Dsei.find(10) },
    { username: "OD0011", password: 'Rapadura1234!@#$', user_type:UserType.first(15).last, active:true, profile:Profile.new(name: 'CUIABÁ'), dsei: Dsei.find(11) },
    { username: "OD0012", password: 'Rapadura1234!@#$', user_type:UserType.first(16).last, active:true, profile:Profile.new(name: 'GUAMÁ-TOCANTINS'), dsei: Dsei.find(12) },
    { username: "OD0013", password: 'Rapadura1234!@#$', user_type:UserType.first(17).last, active:true, profile:Profile.new(name: 'INTERIOR SUL'), dsei: Dsei.find(13) },
    { username: "OD0014", password: 'Rapadura1234!@#$', user_type:UserType.first(18).last, active:true, profile:Profile.new(name: 'KAIAPÓ DO MATO GROSSO'), dsei: Dsei.find(14) },
    { username: "OD0015", password: 'Rapadura1234!@#$', user_type:UserType.first(19).last, active:true, profile:Profile.new(name: 'KAIAPÓ DO PARÁ'), dsei: Dsei.find(15) },
    { username: "OD0016", password: 'Rapadura1234!@#$', user_type:UserType.first(20).last, active:true, profile:Profile.new(name: 'LESTE DE RORAIMA'), dsei: Dsei.find(16) },
    { username: "OD0017", password: 'Rapadura1234!@#$', user_type:UserType.first(21).last, active:true, profile:Profile.new(name: 'LITORAL SUL'), dsei: Dsei.find(17) },
    { username: "OD0018", password: 'Rapadura1234!@#$', user_type:UserType.first(22).last, active:true, profile:Profile.new(name: 'MANAUS'), dsei: Dsei.find(18) },
    { username: "OD0019", password: 'Rapadura1234!@#$', user_type:UserType.first(23).last, active:true, profile:Profile.new(name: 'MARANHÃO'), dsei: Dsei.find(19) },
    { username: "OD0020", password: 'Rapadura1234!@#$', user_type:UserType.first(24).last, active:true, profile:Profile.new(name: 'MATO GROSSO DO SUL'), dsei: Dsei.find(20) },
    { username: "OD0021", password: 'Rapadura1234!@#$', user_type:UserType.first(25).last, active:true, profile:Profile.new(name: 'MÉDIO RIO PURUS'), dsei: Dsei.find(21) },
    { username: "OD0022", password: 'Rapadura1234!@#$', user_type:UserType.first(26).last, active:true, profile:Profile.new(name: 'MÉDIO RIO SOLIMÕES E AFLUENTES'), dsei: Dsei.find(22) },
    { username: "OD0023", password: 'Rapadura1234!@#$', user_type:UserType.first(27).last, active:true, profile:Profile.new(name: 'MINAS GERAIS E ESPÍRITO SANTO'), dsei: Dsei.find(23) },
    { username: "OD0024", password: 'Rapadura1234!@#$', user_type:UserType.first(28).last, active:true, profile:Profile.new(name: 'PARINTINS'), dsei: Dsei.find(24) },
    { username: "OD0025", password: 'Rapadura1234!@#$', user_type:UserType.first(29).last, active:true, profile:Profile.new(name: 'PERNAMBUCO'), dsei: Dsei.find(25) },
    { username: "OD0026", password: 'Rapadura1234!@#$', user_type:UserType.first(30).last, active:true, profile:Profile.new(name: 'PORTO VELHO'), dsei: Dsei.find(26) },
    { username: "OD0027", password: 'Rapadura1234!@#$', user_type:UserType.first(31).last, active:true, profile:Profile.new(name: 'POTIGUARA'), dsei: Dsei.find(27) },
    { username: "OD0028", password: 'Rapadura1234!@#$', user_type:UserType.first(32).last, active:true, profile:Profile.new(name: 'RIO TAPAJÓS'), dsei: Dsei.find(28) },
    { username: "OD0029", password: 'Rapadura1234!@#$', user_type:UserType.first(33).last, active:true, profile:Profile.new(name: 'TOCANTINS'), dsei: Dsei.find(29) },
    { username: "OD0030", password: 'Rapadura1234!@#$', user_type:UserType.first(34).last, active:true, profile:Profile.new(name: 'VALE DO JAVARI'), dsei: Dsei.find(30) },
    { username: "OD0031", password: 'Rapadura1234!@#$', user_type:UserType.first(35).last, active:true, profile:Profile.new(name: 'VILHENA'), dsei: Dsei.find(31) },
    { username: "OD0032", password: 'Rapadura1234!@#$', user_type:UserType.first(36).last, active:true, profile:Profile.new(name: 'XAVANTE'), dsei: Dsei.find(32) },
    { username: "OD0033", password: 'Rapadura1234!@#$', user_type:UserType.first(37).last, active:true, profile:Profile.new(name: 'XINGU'), dsei: Dsei.find(33) },
    { username: "OD0034", password: 'Rapadura1234!@#$', user_type:UserType.first(38).last, active:true, profile:Profile.new(name: 'YANOMAMI'), dsei: Dsei.find(34) }

])
end

if Pdsi.count == 0
    Pdsi.create!([
      { id: 1, dsei_id:1, user_id: User.find(5)},
      { id: 2, dsei_id:2, user_id: User.find(6)},
      { id: 3, dsei_id:3, user_id: User.find(7)},
      { id: 4, dsei_id:4, user_id: User.find(8)},
      { id: 5, dsei_id:5, user_id: User.find(9)},
      { id: 6, dsei_id:6, user_id: User.find(10)},
      { id: 7, dsei_id:7, user_id: User.find(11)},
      { id: 8, dsei_id:8, user_id: User.find(12)},
      { id: 9, dsei_id:9, user_id: User.find(13)},
      { id: 10, dsei_id:10, user_id: User.find(14)},
      { id: 11, dsei_id:11, user_id: User.find(15)},
      { id: 12, dsei_id:12, user_id: User.find(16)},
      { id: 13, dsei_id:13, user_id: User.find(17)},
      { id: 14, dsei_id:14, user_id: User.find(18)},
      { id: 15, dsei_id:15, user_id: User.find(19)},
      { id: 16, dsei_id:16, user_id: User.find(20)},
      { id: 17, dsei_id:17, user_id: User.find(21)},
      { id: 18, dsei_id:18, user_id: User.find(22)},
      { id: 19, dsei_id:19, user_id: User.find(23)},
      { id: 20, dsei_id:20, user_id: User.find(24)},
      { id: 21, dsei_id:21, user_id: User.find(25)},
      { id: 22, dsei_id:22, user_id: User.find(26)},
      { id: 23, dsei_id:23, user_id: User.find(27)},
      { id: 24, dsei_id:24, user_id: User.find(28)},
      { id: 25, dsei_id:25, user_id: User.find(29)},
      { id: 26, dsei_id:26, user_id: User.find(30)},
      { id: 27, dsei_id:27, user_id: User.find(31)},
      { id: 28, dsei_id:28, user_id: User.find(32)},
      { id: 29, dsei_id:29, user_id: User.find(33)},
      { id: 30, dsei_id:30, user_id: User.find(34)},
      { id: 31, dsei_id:31, user_id: User.find(35)},
      { id: 32, dsei_id:32, user_id: User.find(36)},
      { id: 33, dsei_id:33, user_id: User.find(37)},
      { id: 34, dsei_id:34, user_id: User.find(38)}
    ])
end

# pdsi_base_polo_data Seeds
if PdsiBasePoloDatum.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'pdsi_base_polo_data.seed.csv')
  sql = <<-COPY_PSQL
    COPY pdsi_base_polo_data(pdsi_id, base_polo_id, city_name, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if Cost.count == 0
  Cost.create!([
    { name: 'MATERIAL MÉDICO HOSPITALAR (MMH)', id: 1 ,ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'CUSTEIO DE SANEAMENTO', id: 2, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'CUSTEIO DE EDIFICAÇÕES', id: 3, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'SATELITAL', id: 4, ask_distribution: true, data_type: 'money' , cost_type: 3},
    { name: 'PASSAGENS E DIÁRIAS (SCDP)', id: 5, ask_distribution: false, data_type: 'money', cost_type: 3 },
    { name: 'CONVÊNIOS PARA CONTRATAÇÃO DE RECURSOS HUMANOS', id: 6, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'MEDICAMENTOS', id: 7, ask_distribution: false, data_type: 'money', cost_type: 3 },
    { name: 'SERVIDORES PÚBLICO FEDERAIS', id: 8, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'COMBUSTÍVEL', id: 9, ask_distribution: true, data_type: 'money', cost_type: 3 },
    { name: 'CONTRATOS', id: 10, ask_distribution: true, data_type: 'money', cost_type: 1 },
    { name: 'ALIMENTAÇÃO', id: 11, ask_distribution: true, data_type: 'money', parent_id: 10, cost_type: 2 },
    { name: '3.3.90.30.07 - Gêneros de Alimentação', id: 12, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: '3.3.90.36.23 - Fornecimento de Alimentação (Outros Serviços de Terceiros - Pessoa Física)', id: 13, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: '3.3.90.39.41 - Fornecimento de Alimentação (Outros Serviço de Terceiros - Pessoa Jurídica)', id: 14, ask_distribution: true, data_type: 'money', parent_id: 11, cost_type: 3 },
    { name: 'HORAS VÔO', id: 15, ask_distribution: false, data_type: 'money', parent_id: 10, cost_type: 2 },
    { name: '3.3.90.33.03 - Horas Vôo', id: 16, ask_distribution: true, data_type: 'money', parent_id: 15, cost_type: 3 },
    { name: 'LOCAÇÃO DE VEÍCULOS', id: 17, ask_distribution: true, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.33.03 - Locação de Veículos', id: 18, ask_distribution: true, data_type: 'money', parent_id: 17, cost_type: 3 },
    { name: '3.3.90.33.05 - Locomoção Urbana', id: 19, ask_distribution: true, data_type: 'money', parent_id: 17 , cost_type: 3},
    { name: '3.3.90.33.09 - Transporte de Servidores', id: 20, ask_distribution: true, data_type: 'money', parent_id: 17 , cost_type: 3},
    { name: 'LOCAÇÃO DE MÃO DE OBRA', id: 21, ask_distribution: true, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.37.01 - Secretária e Recepcionista', id: 22, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Motorista', id: 23, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Barqueiro', id: 24, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.01 - Artíficie', id: 25, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.02 - Limpeza e Conservação', id: 26, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.03 - Vigilância Ostensiva', id: 27, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.05 - Serviço de Copa e Cozinha ', id: 28, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: '3.3.90.37.06 - Manutenção e Conservação de Bens Movéis', id: 29, ask_distribution: true, data_type: 'money', parent_id: 21 , cost_type: 3},
    { name: 'OUTROS CONTRATOS', id: 30, ask_distribution: false, data_type: 'money', parent_id: 10 , cost_type: 2},
    { name: '3.3.90.30.03 - Combustíveis e Outros Materiais Lubrificantes', id: 31, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.04 - Gás e Outros Materiais Engarrafados', id: 32, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.14 - Material Educativo e Esportivo', id: 33, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.16 - Material de Expediente', id: 34, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.17 - Material de Processamento de Dados', id: 35, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.19 - Material de Acondicionamento e Embalagem', id: 36, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.20 - Material de Cama, Mesa e Banho', id: 37, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.21 - Material de Copa e Cozinha', id: 38, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.22 - Material de Limpeza e Prod. de Higienização', id: 39, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.23 - Uniformes, Tercidos e Aviamentos', id: 40, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.25 - Material p/Manutenção de Bens Móveis', id: 41, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.26 - Material Elétrico e Eletrônico', id: 42, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.28 - Material de Proteção e Segurança', id: 43, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.34 - Sobressal. Máq. e Motores, Navios e Embarcações', id: 44, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.30.39 - Material p/ Manutenção de Veículos', id: 45, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.42 - Ferramentas', id: 46, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.30.44 - Material de Sinalização Visual e Outros', id: 47, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.33.03 - Embarcação Fluvial', id: 48, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.33.08 - Pedágios', id: 49, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.06 - Serviços Técnicos Profissionais', id: 50, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.15 - Locação de Imóveis', id: 51, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.16 - Locação de Bens Móveis e Intangíveis', id: 52, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.36.17 - Tributos a Conta do Locatário ou Cessionário ', id: 53, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.36.35 - Serviço de Apoio Administrativo, Técnico e Operacional', id: 54, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.46 - Diárias a Conselheiros', id: 55, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.36.80 - Hospedagens', id: 56, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.39.01 - Assinatura de Periódicos e Anuidade', id: 57, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.90.39.05 - Serviços Técnicos Profissionais', id: 58, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.08 - Manutenção de Software', id: 59, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.09 - Armazenagem', id: 60, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.10 - Locação de Imóveis', id: 61, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.11 - Locação de Software', id: 62, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.70 - Confecções de Uniformes, Bandeiras e Flâmulas', id: 63, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.74 - Fretes e Transp. de Encomendas  ', id: 64, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.75 - Serviço de Incineração, Destruição e Demolição', id: 65, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.78 - Limpeza e Conservação', id: 66, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.80 - Hospedagens', id: 67, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.83 - Serviços de Cópias e Reprodução de Documentos', id: 68, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.95 - Manutenção e Conserv. Equip. de Processamento de dados', id: 69, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.90.39.97 - Comunicação de Dados', id: 70, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.91.39.01 - Assinaturas e Periódicos e Anuidades', id: 71, ask_distribution: true, data_type: 'money', parent_id: 30, cost_type: 3 },
    { name: '3.3.91.39.47 - Serviços de Comunicação em Geral ', id: 72, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3},
    { name: '3.3.91.39.90 - Serviços de Publicidade Legal', id: 73, ask_distribution: true, data_type: 'money', parent_id: 30 , cost_type: 3}
  ])
end

#{ name: 'GÊNEROS DE ALIMENTAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 11 },
#{ name: 'FORNECIMENTO DE ALIMENTAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 11 },
#{ name: 'APOIO ADMINISTRATIVO, TÉCNICO E OPERACIONAL', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'LIMPEZA E CONSERVAÇÃO', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'VIGILÂNCIA OSTENSIVA', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'MANUTENÇÃO E CONSERVAÇÃO DE BENS IMÓVEIS', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'SERVIÇO DE COPA E COZINHA', ask_distribution: true, data_type: 'money', parent_id: 14 },
#{ name: 'SECRETÁRIA, RECEPCIONISTA', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'MOTORISTA', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'BARQUEIRO', ask_distribution: true, data_type: 'money', parent_id: 18 },
#{ name: 'ARTÍFICE', ask_distribution: true, data_type: 'money', parent_id: 18 },

if AbsoluteDatumLevel.count == 0
  AbsoluteDatumLevel.create!([
    {name: "Polo Base"},
    {name: "CASAI"},
    {name: "DSEI"}
  ])
end

if AbsoluteDatum.count == 0
  AbsoluteDatum.create!([
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS MATERNOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE NASCIDOS VIVOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE MENORES DE 1 ANO COM ATENDIMENTO"},
    {absolute_datum_level_id: 1, name: "POPULAÇÃO DE MENORES DE 1 ANO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS QUE RECEBERAM AÇÕES DE EDUCAÇÃO EM SAÚDE"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS DE MENORES DE 1 ANO INVESTIGADOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ÓBITOS DE MENORES DE 1 ANO EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO TOTAL DE ÓBITOS MATERNOS INVESTIGADOS EM 2014"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ENCAMINHAMENTOS PARA AS CASAI DE CASOS SENSÍVEIS À ATENÇÃO BÁSICA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ENCAMINHAMENTOS PARA AS CASAI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM ACESSO A ÁGUA TRATADA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SISTEMAS DE ABASTECIMENTO DE ÁGUA (SAA)"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA COM MQAI IMPLANTADOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM SAA IMPLANTADOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM DESTINO ADEQUADO DE DEJETOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM DESTINO ADEQUADO DE RESÍDUOS SÓLIDOS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE MÉDICOS EM EMSI, POLOS BASE E CASAIS"},
    {absolute_datum_level_id: 1, name: "POPULAÇÃO TOTAL"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE EMSI COMPLETAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE EMSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE PROFISSIONAIS DO SASISUS EM EDUCAÇÃO PERMANENTE"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE PROFISSIONAIS DO SASISUS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 50 A 250 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 50 A 250 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 251 A 500 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS DE 251 A 500 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM MAIS DE 501 INDÍGENAS COBERTAS POR UBSI"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ALDEIAS COM MAIS DE 501 INDÍGENAS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE CONSULTÓRIOS FIXOS E PORTÁTEIS EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE CONSULTÓRIOS FIXOS E PORTÁTEIS"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS QUE POSSUEM REDE LÓGICA E INTERNET EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS (SEDE, PÓLOS BASE, CASAI, UBSI)"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS COM SIASI EM FUNCIONAMENTO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS COM HÓRUS EM OPERAÇÃO"},
    {absolute_datum_level_id: 1, name: "NÚMERO DE ESTABELECIMENTOS DE SAÚDE NO CNES"},
    {absolute_datum_level_id: 2, name: "NÚMERO DE DIAS DE PERMANÊNCIA DOS USUÁRIOS NAS CASAI EM 2014"},
    {absolute_datum_level_id: 2, name: "NÚMERO DE USUÁRIOS DAS CASAI EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS DO CONDISI REALIZADAS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS PROGRAMADAS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE REUNIÕES ORDINÁRIAS REALIZADAS NOS CONSELHOS LOCAIS EM 2015"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS DISTRITAIS QUALIFICADOS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS DISTRITAIS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS LOCAIS QUALIFICADOS EM 2014"},
    {absolute_datum_level_id: 3, name: "NÚMERO DE CONSELHEIROS LOCAIS EM 2014"}
  ])
end

if HumanResourceFunction.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'human_resource_functions.seed.csv')
  sql = <<-COPY_PSQL
    COPY human_resource_functions(name, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if DestinationType.count == 0
  DestinationType.create!([
    { name: 'UBSI' },
    { name: 'Polo Base' },
    { name: 'CASAI' },
    { name: 'Média e Alta Complexidade' }
  ])
end

if ResultLevel.count == 0
  ResultLevel.create!([
    { name: 'Nacional' },
    { name: 'DSEI' },
  ])
end

if ResultAxis.count == 0
  ResultAxis.create!([
    { name: 'ATENÇÃO À SAÚDE' },
    { name: 'SANEAMENTO AMBIENTAL' },
    { name: 'LOGÍSTICA E INFRAESTRUTURA' },
    { name: 'MODELO DE GESTÃO' },
    { name: 'PLANEJAMENTO E GESTÃO DA INFORMAÇÃO' },
    { name: 'QUALIFICAÇÃO DO GASTO PÚBLICO' },
    { name: 'COMUNICAÇÃO' },
    { name: 'ARTICULAÇÃO INTERFEDERATIVA' },
    { name: 'CONTROLE SOCIAL' },
  ])
end



# ResultStrategy Seeds
if ResultStrategy.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'result_strategy.seed.csv')
  sql = <<-COPY_PSQL
    COPY investment_cities(name, result_axis_id)
      FROM '#{seed_path}'
      WITH
        DELIMITER ','
        NULL 'null'
        CSV
          HEADER
    COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end


if Result.count == 0
    seed_path = File.join(Rails.root, 'db', 'seeds', 'result.seed.csv')
    sql = <<-COPY_PSQL
      COPY investment_cities(result_level_id, result_strategy_id, name, result_text, is_boolean, is_specific, is_percentage, value_global, value_2016, value_2017, value_2018, value_2019, orientacoes_dsei, orientacoes_sistema)
        FROM '#{seed_path}'
        WITH
          DELIMITER ','
          NULL 'null'
          CSV
            HEADER
      COPY_PSQL
    ActiveRecord::Base.connection.execute(sql)
end

if ProjectionBudgetCategory.count == 0
  ProjectionBudgetCategory.create!([
    { name: 'Obras de Edificações' },
    { name: 'Obras de Saneamento' },
    { name: 'Equipamentos' },
  ])
end

if ProjectionBudgetItem.count == 0
  ProjectionBudgetItem.create!([
    { projection_budget_category_id: 1, name: 'CASAI' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo I' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo II' },
    { projection_budget_category_id: 1, name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo III' },
    { projection_budget_category_id: 1, name: 'SEDE DO NÚCLEO DISTRITAL DA SESAI' },
    { projection_budget_category_id: 1, name: 'PÓLO-BASE' },
    { projection_budget_category_id: 1, name: 'REFORMAS' },

    { projection_budget_category_id: 2, name: 'SISTEMA DE ABASTECIMENTO DE ÁGUA (SAA)' },
    { projection_budget_category_id: 2, name: 'MELHORIAS SANITÁRIAS DOMICILIARES (MSD)' },
    { projection_budget_category_id: 2, name: 'ESGOTAMENTO SANITÁRIO' },

    { projection_budget_category_id: 3, name: 'VEÍCULOS' },
    { projection_budget_category_id: 3, name: 'BARCOS' },
    { projection_budget_category_id: 3, name: 'MOTORES DE BARCO' },
    { projection_budget_category_id: 3, name: 'GERADORES' },
    { projection_budget_category_id: 3, name: 'EQUIPAMENTOS MÉDICO-HOSPITALARES (EMH)' },
    { projection_budget_category_id: 3, name: 'EQUIPAMENTOS DE SANEAMENTO' },
    { projection_budget_category_id: 3, name: 'MOBILIÁRIO' },
  ])
end

if TextTemplate.count == 0
  TextTemplate.create!([
    { introducao_1: '<p><strong>1.1 Apresentação&nbsp;</strong></p><p>A SESAI é a área do Ministério da Saúde criada em 2010 para  coordenar e executar o processo de gestão do Subsistema de Atenção à Saúde  Indígena em todo Território Nacional. Sua missão é promover a atenção à saúde  aos povos indígenas, aprimorando as ações de atenção básica e de saneamento  básico nas aldeias, observando as práticas de saúde e os saberes tradicionais,  articulando com os demais gestores do SUS para prover ações complementares e  especializadas, com controle social. </p><p>A criação da Secretaria Especial de Saúde Indígena (SESAI),  no final de 2010, representou um grande avanço na atenção à saúde indígena e  traz grandes desafios de gestão para o Ministério da Saúde. É uma Secretaria  que, diferentemente das demais Secretarias do Ministério da Saúde, executa  diretamente os serviços de atenção e prevenção à saúde, atuando nacionalmente  através de equipamentos e pessoal próprios.</p><p>Para implementar o Subsistema de Atenção à Saúde Indígena e executar  suas ações, a estrutura administrativa da SESAI conta com 3 departamentos<!--[if !supportFootnotes]-->[1] no  âmbito central e 34 Distritos Sanitários Especiais Indígenas (DSEIs), que são  as unidades gestoras descentralizadas do Subsistema, responsáveis pela execução  de ações de atenção à saúde nas aldeias, saneamento ambiental e edificações de  saúde indígena.</p><p>Os Planos Distritais de Saúde Indígena (PDSI) permitem o  planejamento da oferta de serviços de atenção à Saúde Indígena atendendo às  especificidades de cada um dos Distrito Especiais de Saúde Indígena. É um  instrumento que visa aprimorar o planejamento da gestão, buscando maior  eficiência e eficácia de suas ações.&nbsp; Os  PDSI possibilitam a integração dos planejamentos de cada Distrito ao Plano  Nacional de Saúde/ Plano Plurianual 2015-2019 e o Planejamento Estratégico da  Secretaria Especial de Saúde Indígena. </p><p>Para efetivar as ações do Subsistema de Atenção à Saúde  Indígena, de forma democrática e participativa, o Plano Distrital de Saúde  Indígena 2016-2019, previsto  na Lei nº 8.080/90, no Decreto nº 3.156/99 e na Portaria nº 3.965/2010, foi  elaborado durante o ano de 2015. &nbsp;O  presente documento além de consolidar o processo e os resultados do Plano  Distrital de Saúde Indígena de <strong>[NOME_DSEI]</strong> para o período 2016-2019,  busca dar visibilidade e transparência para a gestão da saúde indígena,  subsidiando assim o exercício de um controle social efetivo sobre a atuação do  governo. </p><p>Nessa introdução, além da apresentação, registram-se os  propósitos e princípios dos PDSI. As etapas e atividades que conformaram o  processo de construção dos PDSI são detalhadas no item 2. </p><p>Fundamental para todo exercício de planejamento é a  construção de um bom diagnóstico sobre a situação atual e a reflexão sobre os  aprendizados de exercícios de planejamento anteriores. </p><p>Nesse sentido, o item 3 do presente documento traz a  caracterização do DSEI - contemplando informações acerca das respectivas  condições socioeconômicas, epidemiológicas e de gestão do sistema. </p><p>O item 4, por sua vez, registra a análise situacional do  DSEI, construída junto ao Controle Social, com a avaliação da implementação do  PDSI referente ao período entre 2012-2015, os indicadores de saúde do Distrito  e a análise sobre os principais desafios do distrito.</p><p>Os resultados esperados para o período 2016-2019  encontram-se registrados no item 5. Complementarmente, o item 6 traz a projeção  &nbsp;orçamentária para o período.</p><p><strong>1.2 Propósitos e Princípios do PDSI</strong></p><p>Por sua importância como instrumento de planejamento, os  Planos Distritais de Saúde Indígena respondem a diversos propósitos, tanto para  a gestão dos Distritos Especiais de Saúde Indígena, como para a gestão da SESAI  Central e para o Controle Social. </p><p>No âmbito dos Distritos Especiais de Saúde Indígena, o PDSI deve  apoiar todo o ciclo do planejamento para a oferta de serviços de saúde no  âmbito distrital, a saber: (i) o diagnóstico das necessidades de saúde do  território; (ii) Apontar os resultados esperados, metas e indicadores, assim  como a projeção do orçamento quadrienal (iii)&nbsp;  definição de prioridades estratégicas para o plano de ação anual,  orientação para a execução das macro-ações (iv) Permitir o monitoramento das  ações, subsidiar a prestação de contas e a aferição de resultados. </p><p>No âmbito da SESAI Central, os PDSI devem permitir um  efetivo conhecimento das necessidades dos DSEIs contribuindo para subsidiar a  definição de prioridades estratégicas para SESAI e garantir o alinhamento entre  os instrumentos de planejamento e gestão (Plano Plurianual, Plano Estratégico  SESAI e PDSIs). Além disso, os PDSI são ferramenta essencial para que a SESAI  central cumpra seu papel no fomento da execução e monitoramento das ações,  assim como acompanhamento da execução orçamentária, base para alimentação do  Relatório Anual de Gestão (RAG).</p><p>Finalmente, no âmbito do Controle Social, na figura dos  Conselhos Distritais de Saúde Indígena, o PDSI permite o acompanhamento e  fiscalização das ações aprovadas, assim como a avaliação do impacto das mesmas sobre  a saúde dos povos indígenas. </p><p>Para  cumprir com esses propósitos, a elaboração dos Planos Distritais de Saúde  Indígena 2016-2019 deve prezar pela clareza de seus conteúdos e garantir ao alinhamento  com os demais instrumentos de planejamento do Governo Federal, assim como a  viabilidade dos resultados previstos. Além disso, devem ser construídos através  do diálogo e consulta com as populações indígenas. Esses princípios  encontram-se registrados e detalhados na figura 1.</p><p><img alt="Figura 1. Princípios para a Formulação do Plano Distrital de Saúde Indígena" class="fr-fin fr-dib" src="/images/Figura1.png" title="Figura 1. Princípios para a Formulação do Plano Distrital de Saúde Indígena" width="671"></p><p>[1]  Departamento de Gestão  da Saúde Indígena (DGESI), Departamento de Atenção à Saúde Indígena  (DASI),&nbsp; Departamento de Saneamento e  Edificações de Saúde (DSESI)</p><p><br></p><p><br></p>', created_at: '2015-10-29 22:54:13.605808', updated_at: '2015-10-30 15:42:12.899835', processo_construcao_pdsi_2: '<p>O processo de construção dos PDSI 2016-2019 foi estruturado  em três etapas: a primeira dedicou-se a atividades preparatórias de formulação  técnica e política do processo, a segunda se constituiu como o momento para a  análise situacional dos Distritos de Saúde Indígena que subsidiou a terceira  etapa, dedicada à elaboração de resultados e planejamento orçamentário, assim  como aprovação dos Planos Distritais de Saúde Indígena. Nas três etapas, o  processo previu momentos de consulta ao controle social, assim como espaço para  devolutivas do governo sobre os resultados da consulta. Nos próximos itens são  detalhados os objetivos e atividades de cada uma das etapas.</p><p>A figura 2, ao final dessa seção registra graficamente as  principais etapas do processo</p><p><br></p><p><strong>Etapa 1. Elaboração da  metodologia de construção do Plano Distrital de Saúde Indígena 2016-2019</strong></p><hr class="fr-tag"><p style="border:none;mso-border-top-alt:solid #31849B .5pt;  mso-border-top-themecolor:accent5;mso-border-top-themeshade:191;mso-border-bottom-alt:  solid #31849B .5pt;mso-border-bottom-themecolor:accent5;mso-border-bottom-themeshade:  191;padding:0cm;mso-padding-alt:1.0pt 0cm 1.0pt 0cm">O principal objetivo dessa  etapa foi promover um processo de reflexão técnica e concertação política sobre  propósitos e formatos para a elaboração dos Planos Distritais de Saúde Indígena  2016-2019.</p><hr class="fr-tag"><p>O processo de construção do PDSI 2016-2019 teve início em  junho de 2015, com a elaboração de uma proposta de metodologia por parte do  Grupo de Trabalho do PDSI (GT-PDSI), composto por todas as áreas da SESAI  Central, cinco coordenadores de DSEI e&nbsp;  um presidente de CONDISI. O GT-PDSI foi criado em maio de 2015, durante  a Oficina de Planejamento Estratégico da Saúde Indígena, que contou com a  presença de todos os coordenadores de DSEI e presidentes de CONDISI. </p><p>O GT-PDSI reuniu-se diversas vezes, totalizando quatro dias  de reuniões, para (i) avaliar avanços e dificuldades do processo de elaboração  do PDSI anterior; (ii) definir os propósitos do PDSI 2016-2019; (iii) definir  os princípios norteadores do processo de construção do PDSI 2016-2019; (iv) &nbsp;definir conteúdo e metodologia processo de  construção do PDSI 2016-2019. Durante essa primeira fase foram definidos, também, os tetos  orçamentários anualizados por DSEI.</p><p>No mês de julho de 2015, a proposta da metodologia foi  apresentada em oficina com coordenadores do DSEI, que tiveram a oportunidade de  sugerir as adaptações necessárias na proposta para que esta respondesse a  necessidade e possibilidades de todos os DSEI.&nbsp;  Entre julho e agosto de 2015 o processo de construção do PDSI 2016-2019  foi apresentado para os Conselhos Distritais de Saúde Indígena.</p><p>Ainda, em agosto de 2015 uma oficina om a participação das  equipes dos DSEI e presidentes do CONIDISI serviu como momento de formação  sobre o processo de elaboração do PDSI, incluindo não só a metodologia de construção,  mas também formação sobre critérios para a definição de tetos orçamentários e  competências da SESAI. Após essa oficina, os presidentes de CONDISI realizaram  devolutiva no âmbito de seus distritos sobre as questões trabalhadas na oficina  de formação.</p><p><br></p><p><strong>Etapa 2: Análise  Situacional dos Distritos Sanitários Especiais Indígenas</strong></p><hr class="fr-tag"><p>O principal objetivo dessa  etapa foi construir um diagnóstico compartilhado de cada território</p><hr class="fr-tag"><p>O diagnóstico consolidado de cada território se alimentou de  diversas fontes: (i) avaliação do PDSI 2012-2015; (ii) Caracterização do DSEI;  (iii) oficinas consultivas com CONDISI e Conselhos Locais para complementações  e levantamento e priorização de necessidades do território.</p><p>Para cumprir com esse objetivo, o primeiro passo foi a realização  da avaliação do PDSI 2012-2015, tanto quantitativo (comparativo entre as metas  planejadas e metas efetivamente alcançadas) como qualitativo (aprendizagens e  desafios do período). Essa avaliação for realizada primeiramente, em julho de  2015, pelas equipes dos DSEIs que se encarregaram de consolidar informações.  Nos meses de julho e agosto, essa avaliação foi compartilhada e complementada  pelos Presidente de CONDISI. &nbsp;As equipes  do DSEI e Pólos Bases se encarregaram também, entre agosto e setembro, de  levantar informações para a caracterização do DSEI, incluindo dados  demográficos, fisiográficos e do mapa de indicadores estratégicos, que servem como linha de base  para o planejamento.</p><p>A avaliação quantitativa e qualitativa do PDSI, assim como  os dados de caracterização do DSEI foram compartilhados em reuniões com os  Conselhos Locais, realizadas entre setembro e outubro. Durante essas oficinas  identificaram-se também os principais desafios e prioridades de cada  território.</p><p class="paragrafo_dsei">[PARAGRAFO_DSEI]</p><p>Os resultados dessa etapa de Análise Situacional  encontram-se registrados nos itens 3 e 4 desse documento. O item 3 traz a  caracterização do território. O item 4.1 registra a avaliação qualitativa do  PDSI 2012-2015, o item 4.2 traz os indicadores do território e o item 4.3 traz  os principais desafios do território. No anexo 1 encontram-se os resultados da  avaliação quantitativa e comparativa entre planejado e realizado no período  2012-2015.</p><p><br></p><p><strong>Etapa 3: Definição dos  Resultados Esperados e do Orçamento Macro para 2016, 2017, 2018 e 2019</strong></p><hr><p style="border:none;mso-border-top-alt:solid #31849B .5pt;  mso-border-top-themecolor:accent5;mso-border-top-themeshade:191;mso-border-bottom-alt:  solid #31849B .5pt;mso-border-bottom-themecolor:accent5;mso-border-bottom-themeshade:  191;padding:0cm;mso-padding-alt:1.0pt 0cm 1.0pt 0cm">Essa etapa buscou consolidar  todos os desafios e prioridades levantados na segunda etapa e endereçá-los  através do planejamento de resultados para o PDSI 2016-2019</p><hr class="fr-tag"><p>Em outubro, foi elaborada a primeira versão dos Resultados  Esperados e o Orçamento Macro para o período de 2016-2019 pelas equipes dos  DSEIS, com base nos insumos elaborados durante a etapa anterior e tendo como  orientador o Plano Estratégico da SESAI (ver item X). &nbsp;Essa primeira versão dos Resultados foi  enviada às áreas centrais da SESAI para que estas pudessem entre outubro e  novembro, analisar viabilidade técnica, financeira e legal das propostas.</p><p>A partir da devolutiva sobre viabilidade das propostas  elaboradas, as equipes dos DSEIS tiveram o mês de novembro para ajustar os  planos, que finalmente foram apresentados e submetidos à aprovação do Conselho  Distrital de Saúde Indígena (CONDISI) com posterior encaminhamento a Secretaria  Especial de Saúde Indígena para homologação, em ato realizado no mês de  dezembro.</p><p><br></p><p><img class="fr-fin fr-dib" alt="Figura 2 Fluxo de Elaboração dos Planos Distritais de Saúde Indígena" src="/images/Figura2.png" width="786" title="Figura 2 Fluxo de Elaboração dos Planos Distritais de Saúde Indígena"></p><p><br></p>', analise_situacional_4: '<p>A análise situacional do Distrito <strong>[NOME_DSEI]</strong> &nbsp;é o ponto de partida para o exercício de planejamento do futuro. Partir de um  bom diagnóstico compartilhado, entre gestão, trabalhadores e usuário, sobre as  especificidades do território é fundamental para entender as maiores  oportunidades e desafios que deverão nortear o planejamento para os próximos  anos. </p><p>Assim, o balanço do PDSI 2012-2015 (item 4.1) busca  registrar os avanços percebidos e as dificuldades enfrentadas pelo distrito no  período anterior. Essa análise deve contribuir com aprendizados que garantam a  aderência e a viabilidade dos resultados planejados. Os indicadores da saúde  indígena (item 4.2) permitem um diagnóstico preciso dos principais desafios  relacionados à saúde, assim como permitirão o acompanhamento da evolução das condições  de saúde no distrito. Os indicadores de saúde contribuem com informações  pertinentes que ajudam a priorização das ações mais urgentes. Considerando que  toda gestão enfrenta limites orçamentários, legais, de infraestrutura e de  recursos humanos, os indicadores proporcionam parâmetros que auxiliam na  escolha sobre como alocar esforços e recursos buscando maior efetividade das  ações.&nbsp; A partir desses dois conjunto de  informações e reflexões, o item 4.3 traz o registro dos principais desafios  para o período 2016-2019, que representam as escolhas estratégicas definidas e  debatidas junto ao controle social. </p>' },

  ])
end

if ResponsabilityLevel.count == 0
  ResponsabilityLevel.create!([
    { name: 'Resultado' },
    { name: 'Produto' },
    { name: 'Ação' },
  ])
end

if BudgetForecast.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'budget_forecasts.seed.csv')
  sql = <<-COPY_PSQL
    COPY budget_forecasts(cost_id, pdsi_id, initial_forecast_2016)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)

  # Create empty records for all costs
  (31..73).map do |cost_id|
    (1..34).map do |pdsi_id|
      BudgetForecast.create!([{ cost_id: cost_id, pdsi_id: pdsi_id, initial_forecast_2016: 0 }])
    end
  end
end


# Update initial forecasts for 2017-2019 based on correction factors of each year
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2017 = initial_forecast_2016 + (initial_forecast_2016*0.017)")
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2018 = initial_forecast_2016 + (initial_forecast_2016*0.02)")
BudgetForecast.find_by_sql("update budget_forecasts set initial_forecast_2019 = initial_forecast_2016 + (initial_forecast_2016*0.025)")

if BudgetCorrectionFactor.count == 0
  BudgetCorrectionFactor.create!([
    { year: 2017, value: 0.017 },
    { year: 2018, value: 0.020 },
    { year: 2019, value: 0.025 }
  ])
end

if CategoryBudget.count == 0
  CategoryBudget.create!([
    {projection_budget_category_id: 1, pdsi_id: 3},
    {projection_budget_category_id: 2, pdsi_id: 3},
    {projection_budget_category_id: 3, pdsi_id: 3}
  ])
end

if Investment.count == 0
  Investment.create!([
    { name: 'Obras de Edificações' },
    { name: 'Obras de Saneamento' },
    { name: 'Equipamentos' },
    { name: 'CASAI', parent_id: 1},
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo I', parent_id: 1 },
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo II', parent_id: 1 },
    { name: 'UNIDADE BÁSICA DE SAÚDE INDÍGENA (UBSI) - Tipo III', parent_id: 1 },
    { name: 'SEDE DO NÚCLEO DISTRITAL DA SESAI', parent_id: 1 },
    { name: 'PÓLO-BASE', parent_id: 1 },
    { name: 'REFORMAS', parent_id: 1 },
    { name: 'SISTEMA DE ABASTECIMENTO DE ÁGUA (SAA)', parent_id: 2 },
    { name: 'MELHORIAS SANITÁRIAS DOMICILIARES (MSD)', parent_id: 2 },
    { name: 'ESGOTAMENTO SANITÁRIO', parent_id: 2 },
    { name: 'VEÍCULOS', parent_id: 3 },
    { name: 'BARCOS', parent_id: 3 },
    { name: 'MOTORES DE BARCO', parent_id: 3 },
    { name: 'GERADORES', parent_id: 3 },
    { name: 'EQUIPAMENTOS MÉDICO-HOSPITALARES (EMH)', parent_id: 3 },
    { name: 'EQUIPAMENTOS DE SANEAMENTO', parent_id: 3 },
    { name: 'MOBILIÁRIO', parent_id: 3 }
  ])
end

if Casai.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'casais.seed.csv')
  sql = <<-COPY_PSQL
    COPY casais(dsei_id, name, city_name, created_at, updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

if City.count == 0
  seed_path = File.join(Rails.root, 'db', 'seeds', 'cities.seed.csv')
  sql = <<-COPY_PSQL
    COPY cities(cod_uf,name_uf,cod_city,city,created_at,updated_at)
    FROM '#{seed_path}'
    WITH DELIMITER ','
    CSV HEADER
  COPY_PSQL
  ActiveRecord::Base.connection.execute(sql)
end

puts '------>> Done!.'
