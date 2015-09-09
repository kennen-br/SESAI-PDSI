require 'rails_helper'

RSpec.describe "demographic_datas/edit", type: :view do
  before(:each) do
    @demographic_data = assign(:demographic_data, DemographicData.create!(
      :pdsi => nil,
      :extensao_territorial => "MyString",
      :municipio_sede => "MyString",
      :endereco => "MyString",
      :email => "MyString",
      :numero_municipios => 1,
      :populacao_indigena => 1,
      :etnias => "MyText",
      :numero_polos_base => 1,
      :numero_ubsi => 1,
      :numero_regioes_de_saude => 1,
      :numero_casais => 1,
      :numero_aldeias => 1,
      :numero_familias => 1,
      :meios_de_transporte => "MyText"
    ))
  end

  it "renders the edit demographic_data form" do
    render

    assert_select "form[action=?][method=?]", demographic_data_path(@demographic_data), "post" do

      assert_select "input#demographic_data_pdsi_id[name=?]", "demographic_data[pdsi_id]"

      assert_select "input#demographic_data_extensao_territorial[name=?]", "demographic_data[extensao_territorial]"

      assert_select "input#demographic_data_municipio_sede[name=?]", "demographic_data[municipio_sede]"

      assert_select "input#demographic_data_endereco[name=?]", "demographic_data[endereco]"

      assert_select "input#demographic_data_email[name=?]", "demographic_data[email]"

      assert_select "input#demographic_data_numero_municipios[name=?]", "demographic_data[numero_municipios]"

      assert_select "input#demographic_data_populacao_indigena[name=?]", "demographic_data[populacao_indigena]"

      assert_select "textarea#demographic_data_etnias[name=?]", "demographic_data[etnias]"

      assert_select "input#demographic_data_numero_polos_base[name=?]", "demographic_data[numero_polos_base]"

      assert_select "input#demographic_data_numero_ubsi[name=?]", "demographic_data[numero_ubsi]"

      assert_select "input#demographic_data_numero_regioes_de_saude[name=?]", "demographic_data[numero_regioes_de_saude]"

      assert_select "input#demographic_data_numero_casais[name=?]", "demographic_data[numero_casais]"

      assert_select "input#demographic_data_numero_aldeias[name=?]", "demographic_data[numero_aldeias]"

      assert_select "input#demographic_data_numero_familias[name=?]", "demographic_data[numero_familias]"

      assert_select "textarea#demographic_data_meios_de_transporte[name=?]", "demographic_data[meios_de_transporte]"
    end
  end
end
