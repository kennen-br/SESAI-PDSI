require 'rails_helper'

RSpec.describe "pdsis/index", type: :view do
  before(:each) do
    assign(:pdsis, [
      Pdsi.create!(
        :user => nil,
        :processo_construcao_pdsi_2 => "MyText"
      ),
      Pdsi.create!(
        :user => nil,
        :processo_construcao_pdsi_2 => "MyText"
      )
    ])
  end

  it "renders a list of pdsis" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
