require 'rails_helper'

RSpec.describe "casais/new", type: :view do
  before(:each) do
    assign(:casai, Casai.new(
      :dsei => nil,
      :name => "MyString"
    ))
  end

  it "renders new casai form" do
    render

    assert_select "form[action=?][method=?]", casais_path, "post" do

      assert_select "input#casai_dsei_id[name=?]", "casai[dsei_id]"

      assert_select "input#casai_name[name=?]", "casai[name]"
    end
  end
end
