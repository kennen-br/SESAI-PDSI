require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        username:               "username1",
        password:               "Rapadura1234!@",
        password_confirmation:  "Rapadura1234!@",
        user_type:              UserType.create(name: 'Teste'),
        profile: Profile.new(
          name: 'Profile name'
        )

      ),
      User.create!(
        username:               "username2",
        password:               "Rapadura1234!@",
        password_confirmation:  "Rapadura1234!@",
        user_type:              UserType.create(name: 'Teste'),
        profile: Profile.new(
          name: 'Profile name'
        )
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "username1".to_s,    count: 1
    assert_select "tr>td", text: "username2".to_s,    count: 1
    assert_select "tr>td", text: "Profile name".to_s, count: 2
  end
end
