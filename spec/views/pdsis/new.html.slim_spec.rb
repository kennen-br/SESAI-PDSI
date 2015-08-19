require 'rails_helper'

RSpec.describe "pdsis/new", type: :view do
  before(:each) do
    assign(:pdsi, Pdsi.new(
      :user => nil,
      :processo_construcao_pdsi_2 => "MyText"
    ))
  end

  it "renders new pdsi form" do
    render

    assert_select "form[action=?][method=?]", pdsis_path, "post" do

      assert_select "input#pdsi_user_id[name=?]", "pdsi[user_id]"

      assert_select "textarea#pdsi_processo_construcao_pdsi_2[name=?]", "pdsi[processo_construcao_pdsi_2]"
    end
  end
end
