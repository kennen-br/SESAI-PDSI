require 'rails_helper'

RSpec.describe "absolute_data/new", type: :view do
  before(:each) do
    assign(:absolute_datum, AbsoluteDatum.new(
      :absolute_datum_level => nil,
      :name => "MyString"
    ))
  end

  it "renders new absolute_datum form" do
    render

    assert_select "form[action=?][method=?]", absolute_data_path, "post" do

      assert_select "input#absolute_datum_absolute_datum_level_id[name=?]", "absolute_datum[absolute_datum_level_id]"

      assert_select "input#absolute_datum_name[name=?]", "absolute_datum[name]"
    end
  end
end
