require 'rails_helper'

RSpec.describe "casais/edit", type: :view do
  before(:each) do
    @casai = assign(:casai, Casai.create!(
      :dsei => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit casai form" do
    render

    assert_select "form[action=?][method=?]", casai_path(@casai), "post" do

      assert_select "input#casai_dsei_id[name=?]", "casai[dsei_id]"

      assert_select "input#casai_name[name=?]", "casai[name]"
    end
  end
end
