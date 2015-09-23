require 'rails_helper'

RSpec.describe "casais/show", type: :view do
  before(:each) do
    @casai = assign(:casai, Casai.create!(
      :dsei => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
