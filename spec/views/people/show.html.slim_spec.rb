require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :dsei => nil,
      :name => "Name",
      :location => "Location",
      :bond => "Bond"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Bond/)
  end
end
