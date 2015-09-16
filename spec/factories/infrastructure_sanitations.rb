FactoryGirl.define do
  factory :infrastructure_sanitation do
    pdsi nil
village nil
abastecimento_agua false
abastecimento_agua_alternativo false
saa_completo false
nome_saa "MyString"
tipo_captacao_agua "MyString"
nome_concessionaria "MyString"
tipo_tratamento_agua "MyString"
abastecimento_mqa false
saa_manutencao false
qtd_msd_individual 1
qtd_msd_coletiva 1
esgotamento_sanitario false
  end

end
