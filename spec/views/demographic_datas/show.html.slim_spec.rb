require 'rails_helper'

RSpec.describe "demographic_datas/show", type: :view do
  before(:each) do
    @demographic_data = assign(:demographic_data, DemographicData.create!(
      :pdsi => nil,
      :extensao_territorial => "Extensao Territorial",
      :municipio_sede => "Municipio Sede",
      :endereco => "Endereco",
      :email => "Email",
      :numero_municipios => 1,
      :populacao_indigena => 2,
      :etnias => "MyText",
      :numero_polos_base => 3,
      :numero_ubsi => 4,
      :numero_regioes_de_saude => 5,
      :numero_casais => 6,
      :numero_aldeias => 7,
      :numero_familias => 8,
      :meios_de_transporte => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Extensao Territorial/)
    expect(rendered).to match(/Municipio Sede/)
    expect(rendered).to match(/Endereco/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/MyText/)
  end
end
