require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :dsei => nil,
      :name => "MyString",
      :location => "MyString",
      :bond => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_dsei_id[name=?]", "person[dsei_id]"

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_location[name=?]", "person[location]"

      assert_select "input#person_bond[name=?]", "person[bond]"
    end
  end
end
