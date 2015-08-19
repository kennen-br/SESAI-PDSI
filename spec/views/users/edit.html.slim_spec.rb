require 'rails_helper'

RSpec.describe "users/edit.html.slim", type: :view do
  before do
    @user = assign(:user, User.create!(
      username:               "username3",
      password:               "Rapadura1234!@",
      password_confirmation:  "Rapadura1234!@",
      user_type:              UserType.create(name: 'Teste'),
      profile: Profile.new(
        name: 'Profile name'
      )
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "select#user_user_type_id[name=?]", "user[user_type_id]"
      assert_select "input#user_profile_attributes_name[name=?]", "user[profile_attributes][name]"
    end
  end
end
