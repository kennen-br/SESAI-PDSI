require 'rails_helper'

RSpec.describe "pdsis/show", type: :view do
  before(:each) do
    @pdsi = assign(:pdsi, Pdsi.create!(
      :user => nil,
      :processo_construcao_pdsi_2 => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
