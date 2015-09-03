# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Cost.all.size == 0
  Cost.create name: 'MATERIAL MÉDICO HOSPITALAR (MMH)',               ask_distribution: true,   data_type: 'money'
  Cost.create name: 'CUSTEIO DE SANEAMENTO',                          ask_distribution: true,   data_type: 'money'
  Cost.create name: 'CUSTEIO DE EDIFICAÇÕES',                         ask_distribution: true,   data_type: 'money'
  Cost.create name: 'SATELITAL',                                      ask_distribution: true,   data_type: 'money'
  Cost.create name: 'PASSAGENS E DIÁRIAS (SCDP)',                     ask_distribution: false,  data_type: 'money'
  Cost.create name: 'CONVÊNIOS PARA CONTRATAÇÃO DE RECURSOS HUMANOS', ask_distribution: true,   data_type: 'money'
  Cost.create name: 'MEDICAMENTOS',                                   ask_distribution: false,  data_type: 'money'
  Cost.create name: 'SERVIDORES PÚBLICO FEDERAIS',                    ask_distribution: true,   data_type: 'money'
  Cost.create name: 'COMBUSTÍVEL',                                    ask_distribution: true,   data_type: 'money'
  Cost.create name: 'CONTRATOS',                                      ask_distribution: true,   data_type: 'money'
  Cost.create name: 'ALIMENTAÇÃO',                                    ask_distribution: true,   data_type: 'money'
  Cost.create name: 'HORAS VÔO',                                      ask_distribution: false,  data_type: 'money'
  Cost.create name: 'LOCAÇÃO DE VEÍCULOS',                            ask_distribution: true,   data_type: 'money'
  Cost.create name: 'LOCAÇÃO DE MÃO DE OBRA',                         ask_distribution: true,   data_type: 'money'
  Cost.create name: 'OUTROS CONTRATOS',                               ask_distribution: false,  data_type: 'money'
end

if UserType.all.size == 0
  UserType.create name: 'Administrador'
  UserType.create name: 'Usuário SESAI Central'
  UserType.create name: 'Operador DSEI'
end

if User.all.size == 0
  User.create!([{ username: "AD0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.first,   active: true, profile: Profile.new(name: 'Administrador 01') }])
  User.create!([{ username: "US0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.second,  active: true, profile: Profile.new(name: 'Operador do SESAI Central 01') }])
  User.create!([{ username: "OD0001", password: 'Rapadura1234!@#$', current_sign_in_ip: "10.0.2.2", last_sign_in_ip: "10.0.2.2", user_type: UserType.last,    active: true, profile: Profile.new(name: 'Operador do DSEI 01') }])
end

if TextTemplate.all.size == 0
  TextTemplate.create
end
