if UserType.count == 0
  UserType.create!([
    {name: "Administrador"},
    {name: "Usuário SESAI Central"},
    {name: "Operador DSEI"}
  ])
end

if User.count == 0
  User.create!([
    { username: "AD0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.first,   active: true, profile: Profile.new(name: 'Administrador 01') },
    { username: "US0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.second,  active: true, profile: Profile.new(name: 'Operador do SESAI Central 01') },
    { username: "OD0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.last,    active: true, profile: Profile.new(name: 'Operador do DSEI 01') }
  ])
end

if Profile.count == 0
  Profile.create!([
    {user_id: 1, name: "Administrador 01", dsei_id: nil},
    {user_id: 2, name: "Operador do SESAI Central 01", dsei_id: nil},
    {user_id: 3, name: "Operador do DSEI 01", dsei_id: nil}
  ])
end

if Cost.count == 0
  Cost.create!([
    {name: "MATERIAL MÉDICO HOSPITALAR (MMH)", ask_distribution: true, data_type: "money"},
    {name: "CUSTEIO DE SANEAMENTO", ask_distribution: true, data_type: "money"},
    {name: "CUSTEIO DE EDIFICAÇÕES", ask_distribution: true, data_type: "money"},
    {name: "SATELITAL", ask_distribution: true, data_type: "money"},
    {name: "PASSAGENS E DIÁRIAS (SCDP)", ask_distribution: false, data_type: "money"},
    {name: "CONVÊNIOS PARA CONTRATAÇÃO DE RECURSOS HUMANOS", ask_distribution: true, data_type: "money"},
    {name: "MEDICAMENTOS", ask_distribution: false, data_type: "money"},
    {name: "SERVIDORES PÚBLICO FEDERAIS", ask_distribution: true, data_type: "money"},
    {name: "COMBUSTÍVEL", ask_distribution: true, data_type: "money"},
    {name: "CONTRATOS", ask_distribution: true, data_type: "money"},
    {name: "ALIMENTAÇÃO", ask_distribution: true, data_type: "money"},
    {name: "HORAS VÔO", ask_distribution: false, data_type: "money"},
    {name: "LOCAÇÃO DE VEÍCULOS", ask_distribution: true, data_type: "money"},
    {name: "LOCAÇÃO DE MÃO DE OBRA", ask_distribution: true, data_type: "money"},
    {name: "OUTROS CONTRATOS", ask_distribution: false, data_type: "money"}
  ])
end

if TextTemplate.count == 0
  TextTemplate.create!([
    {introducao_1: "Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.\r\n<hr />\r\n<strong>Nome do DSEI: [NOME_DSEI]</strong>\r\n<hr />\r\nSuco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis. Interagi no mé, cursus quis, vehicula ac nisi. Aenean vel dui dui. Nullam leo erat, aliquet quis tempus a, posuere ut mi. Ut scelerisque neque et turpis posuere pulvinar pellentesque nibh ullamcorper. Pharetra in mattis molestie, volutpat elementum justo. Aenean ut ante turpis. Pellentesque laoreet mé vel lectus scelerisque interdum cursus velit auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mauris lectus, non scelerisque augue. Aenean justo massa.", processo_construcao_pdsi_2: "Silvio Santos Ipsum É bom ou não éam? É por sua conta e riscoamm? É bom ou não éam? Eu não queria perguntar isso publicamente, ma vou perguntar. Carla, você tem o ensino fundamentauam? Ma o Silvio Santos Ipsum é muitoam interesanteam. Com ele ma você vai gerar textuans ha haae. Ha haeeee. Hi hi. Ma vale dérreaisam? Eu não queria perguntar isso publicamente, ma vou perguntar. Carla, você tem o ensino fundamentauam? Eu só acreditoammmm.... Vendoammmm. Ma! Ao adquirir o carnê do Baú, você estará concorrendo a um prêmio de cem mil reaisam. Qual é a musicamm?\r\n<br /><br />\r\n Ma você está certo dissoam? O arriscam tuduam, valendo um milhão de reaisuam. Wellintaaammmmmmmmm. É com você Lombardiam. Você veio da caravana de ondeammm? Wellintaaammmmmmmmm. Mah roda a roduamm. Boca sujuam... sem vergonhuamm. O prêmio é em barras de ouro, que vale mais que dinheiroam. É com você Lombardiam. Eu não queria perguntar isso publicamente, ma vou perguntar. Carla, você tem o ensino fundamentauam?\r\n<hr />\r\n<strong>[PARAGRAFO_DSEI]</strong>\r\n<hr />"}
  ])
end

if Pdsi.count == 0
  Pdsi.create!([
    {user_id: 3, processo_construcao_pdsi_2: "man Claymine deviled department Knope Lagavulin bandsaw government effigy mustache alcohol turkey bacon schlemiel tolerance hooves melancholy crusade respect worst Tammy pork hunting workshop kill property business Horsemeals Pawnee.\r\n<br /><br />\r\nkill respect workshop scam Swoopeses April hooves whittel ribs melancholy alcohol privatized Claymine property horrible tax bacon worst liberty spokeshave Humpsville.\r\n<br /><br />\r\nwreathes tolerance Horsemeals Lagavulin tornado horrible philosophy Ron effigy steel property Humpsville fighting communists privatized whiskey rectangle hunting bandsaw Claymine manager melancholy Duke breakfast.", caracterizacao_do_dsei_3: "Occupy VHS health goth church-key, Thundercats asymmetrical authentic put a bird on it fashion axe. Fanny pack letterpress scenester, butcher mustache bicycle rights irony listicle quinoa biodiesel hoodie heirloom. Shabby chic butcher Wes Anderson, cray deep v plaid ethical pug jean shorts typewriter meggings yr Kickstarter locavore Schlitz. Intelligentsia Portland typewriter twee 90's. Listicle heirloom try-hard scenester fingerstache butcher, bitters letterpress. Gluten-free lo-fi Etsy sustainable cred, XOXO put a bird on it forage stumptown organic. Taxidermy cold-pressed bitters, Williamsburg seitan +1 master cleanse sriracha ennui freegan you probably haven't heard of them Pinterest.\r\n<br /><br />\r\nMcSweeney's PBR&B four dollar toast Pitchfork ennui banjo. Flexitarian paleo salvia tilde Thundercats heirloom. Forage 8-bit skateboard, tousled umami tofu meggings lomo. Semiotics kogi retro, Williamsburg flexitarian chambray shabby chic Brooklyn keytar lomo hashtag. Tattooed authentic raw denim, squid bicycle rights slow-carb chambray locavore retro. Odd Future vegan ethical, kitsch drinking vinegar mixtape before they sold out distillery bitters tattooed photo booth asymmetrical you probably haven't heard of them. Heirloom mlkshk polaroid distillery.", map_file_name: nil, map_content_type: nil, map_file_size: nil, map_updated_at: nil}
  ])
end

if DemographicData.count == 0
  DemographicData.create!([
    { pdsi_id: 1, extensao_territorial: "123,45 KM2", municipio_sede: "São Jorge do Patrocínio", endereco: "Rua Hum, Quadra Dois. Número Três, Bloco Quatro, Apartamento Cinco.", email: "rodrigo@devlandia.net", numero_municipios: 1, populacao_indigena: 2, numero_polos_base: 3, numero_ubsi: 4, numero_regioes_de_saude: 5, numero_casais: 6, numero_aldeias: 7, numero_familias: 8 }
  ])
end
