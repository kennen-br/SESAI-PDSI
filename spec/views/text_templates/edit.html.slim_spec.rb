require 'rails_helper'

RSpec.describe "text_templates/edit", type: :view do
  before(:each) do
    @text_template  = assign(:text_template, TextTemplate.first_or_create( introducao_1: "My introduction text"))
  end

  it "renders the edit text_template form" do
    @section  = 'introducao'
    render

    assert_select "form[action=?][method=?]", text_template_path(@text_template, section: @section), "post" do
      assert_select "textarea#text_template_introducao_1[name=?]", "text_template[introducao_1]"
    end
  end
end
