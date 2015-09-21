require 'rails_helper'

RSpec.describe "absolute_data/show", type: :view do
  before(:each) do
    @absolute_datum = assign(:absolute_datum, AbsoluteDatum.create!(
      :absolute_datum_level => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
