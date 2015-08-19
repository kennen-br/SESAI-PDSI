require 'rails_helper'

RSpec.describe "dado_demograficos/edit", type: :view do
  before(:each) do
    @dado_demografico = assign(:dado_demografico, DadoDemografico.create!(
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

  it "renders the edit dado_demografico form" do
    render

    assert_select "form[action=?][method=?]", dado_demografico_path(@dado_demografico), "post" do

      assert_select "input#dado_demografico_pdsi_id[name=?]", "dado_demografico[pdsi_id]"

      assert_select "input#dado_demografico_extensao_territorial[name=?]", "dado_demografico[extensao_territorial]"

      assert_select "input#dado_demografico_municipio_sede[name=?]", "dado_demografico[municipio_sede]"

      assert_select "input#dado_demografico_endereco[name=?]", "dado_demografico[endereco]"

      assert_select "input#dado_demografico_email[name=?]", "dado_demografico[email]"

      assert_select "input#dado_demografico_numero_municipios[name=?]", "dado_demografico[numero_municipios]"

      assert_select "input#dado_demografico_populacao_indigena[name=?]", "dado_demografico[populacao_indigena]"

      assert_select "textarea#dado_demografico_etnias[name=?]", "dado_demografico[etnias]"

      assert_select "input#dado_demografico_numero_polos_base[name=?]", "dado_demografico[numero_polos_base]"

      assert_select "input#dado_demografico_numero_ubsi[name=?]", "dado_demografico[numero_ubsi]"

      assert_select "input#dado_demografico_numero_regioes_de_saude[name=?]", "dado_demografico[numero_regioes_de_saude]"

      assert_select "input#dado_demografico_numero_casais[name=?]", "dado_demografico[numero_casais]"

      assert_select "input#dado_demografico_numero_aldeias[name=?]", "dado_demografico[numero_aldeias]"

      assert_select "input#dado_demografico_numero_familias[name=?]", "dado_demografico[numero_familias]"

      assert_select "textarea#dado_demografico_meios_de_transporte[name=?]", "dado_demografico[meios_de_transporte]"
    end
  end
end
