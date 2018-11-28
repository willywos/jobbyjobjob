require 'rails_helper'

RSpec.describe "users/settings.html.erb", type: :view do
  before(:each) do
    @user = FactoryBot.build_stubbed(:user)
    allow(view).to receive(:current_user).and_return(@user)
    sign_in(@user)

    @user = assign(:user, @user)
  end

  it "renders the edit user form" do
    render
    assert_select "form[action=?][method=?]", update_user_settings_path, "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_address[name=?]", "user[address]"
      assert_select "input#user_city[name=?]", "user[city]"
      assert_select "input#user_state[name=?]", "user[state]"
      assert_select "input#user_zip[name=?]", "user[zip]"
      assert_select "input#user_phone_number[name=?]", "user[phone_number]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_password_confirmation[name=?]", "user[password_confirmation]"
    end
  end
end
