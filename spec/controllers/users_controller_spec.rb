require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @user = FactoryBot.build_stubbed(:user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)
  end

  let(:valid_attributes) {
      {
        first_name:"Test",
        last_name:"User",
        password:"Password1!",
        password_confirmation:"Password1!"
      }
  }

  describe "GET #settings" do
    it "returns http success" do
      get :settings
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update_settings" do
    it "returns http success" do
      expect(@user).to receive(:update).and_return(true)
      patch :update_settings, params: { user: valid_attributes }
      expect(response).to redirect_to(user_settings_path)
    end
  end
end
