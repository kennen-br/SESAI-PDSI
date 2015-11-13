require 'rails_helper'

RSpec.describe "results/show", type: :view do
  before(:each) do
    @result = assign(:result, Result.create!(
      :result_level => "",
      :result_strategy => nil,
      :name => "Name",
      :reference_value => 1,
      :parent_id => nil,
      :is_specific => false,
      :is_percentage => false,
      :result_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
