require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :dsei => nil,
      :name => "MyString",
      :location => "MyString",
      :bond => "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_dsei_id[name=?]", "person[dsei_id]"

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_location[name=?]", "person[location]"

      assert_select "input#person_bond[name=?]", "person[bond]"
    end
  end
end
