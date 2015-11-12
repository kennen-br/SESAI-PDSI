require 'rails_helper'

RSpec.describe "results/index", type: :view do
  before(:each) do
    assign(:results, [
      Result.create!(
        :result_level => "",
        :result_strategy => nil,
        :name => "Name",
        :reference_value => 1,
        :parent_id => nil,
        :is_specific => false,
        :is_percentage => false,
        :result_text => "MyText"
      ),
      Result.create!(
        :result_level => "",
        :result_strategy => nil,
        :name => "Name",
        :reference_value => 1,
        :parent_id => nil,
        :is_specific => false,
        :is_percentage => false,
        :result_text => "MyText"
      )
    ])
  end

  it "renders a list of results" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
