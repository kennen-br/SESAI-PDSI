require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :dsei => nil,
        :name => "Name",
        :location => "Location",
        :bond => "Bond"
      ),
      Person.create!(
        :dsei => nil,
        :name => "Name",
        :location => "Location",
        :bond => "Bond"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Bond".to_s, :count => 2
  end
end
