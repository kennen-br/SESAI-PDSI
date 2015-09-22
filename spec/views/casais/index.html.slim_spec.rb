require 'rails_helper'

RSpec.describe "casais/index", type: :view do
  before(:each) do
    assign(:casais, [
      Casai.create!(
        :dsei => nil,
        :name => "Name"
      ),
      Casai.create!(
        :dsei => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of casais" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
