require 'rails_helper'

RSpec.describe "pdsis/edit", type: :view do
  before(:each) do
    @pdsi = assign(:pdsi, Pdsi.create!(
      :user => nil,
      :processo_construcao_pdsi_2 => "MyText"
    ))
  end

  it "renders the edit pdsi form" do
    render

    assert_select "form[action=?][method=?]", pdsi_path(@pdsi), "post" do

      assert_select "input#pdsi_user_id[name=?]", "pdsi[user_id]"

      assert_select "textarea#pdsi_processo_construcao_pdsi_2[name=?]", "pdsi[processo_construcao_pdsi_2]"
    end
  end
end
