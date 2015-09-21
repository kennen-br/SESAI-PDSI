require 'rails_helper'

RSpec.describe "absolute_data/index", type: :view do
  before(:each) do
    assign(:absolute_data, [
      AbsoluteDatum.create!(
        :absolute_datum_level => nil,
        :name => "Name"
      ),
      AbsoluteDatum.create!(
        :absolute_datum_level => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of absolute_data" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
