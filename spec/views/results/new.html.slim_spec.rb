require 'rails_helper'

RSpec.describe "results/new", type: :view do
  before(:each) do
    assign(:result, Result.new(
      :result_level => "",
      :result_strategy => nil,
      :name => "MyString",
      :reference_value => 1,
      :parent_id => nil,
      :is_specific => false,
      :is_percentage => false,
      :result_text => "MyText"
    ))
  end

  it "renders new result form" do
    render

    assert_select "form[action=?][method=?]", results_path, "post" do

      assert_select "input#result_result_level[name=?]", "result[result_level]"

      assert_select "input#result_result_strategy_id[name=?]", "result[result_strategy_id]"

      assert_select "input#result_name[name=?]", "result[name]"

      assert_select "input#result_reference_value[name=?]", "result[reference_value]"

      assert_select "input#result_parent_id_id[name=?]", "result[parent_id_id]"

      assert_select "input#result_is_specific[name=?]", "result[is_specific]"

      assert_select "input#result_is_percentage[name=?]", "result[is_percentage]"

      assert_select "textarea#result_result_text[name=?]", "result[result_text]"
    end
  end
end
