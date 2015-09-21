require 'rails_helper'

RSpec.describe "absolute_data/edit", type: :view do
  before(:each) do
    @absolute_datum = assign(:absolute_datum, AbsoluteDatum.create!(
      :absolute_datum_level => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit absolute_datum form" do
    render

    assert_select "form[action=?][method=?]", absolute_datum_path(@absolute_datum), "post" do

      assert_select "input#absolute_datum_absolute_datum_level_id[name=?]", "absolute_datum[absolute_datum_level_id]"

      assert_select "input#absolute_datum_name[name=?]", "absolute_datum[name]"
    end
  end
end
