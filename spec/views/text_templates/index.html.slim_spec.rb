require 'rails_helper'

RSpec.describe "text_templates/index", type: :view do
  before(:each) do
    assign(:text_template, TextTemplate.first_or_create( introducao_1: "My introduction text"))
  end

  it "show sections of a text_template" do
    render

    assert_select "h2",       text: '1. Introdução',        count: 1
    assert_select "fieldset", text: /My introduction text/, count: 1
  end
end
