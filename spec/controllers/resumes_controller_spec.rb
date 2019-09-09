require 'rails_helper'

RSpec.describe ResumesController, type: :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @user   = FactoryBot.build_stubbed(:user)
    @user2  = FactoryBot.build_stubbed(:user, email:"example2@test.com")
    @resume = FactoryBot.build_stubbed(:resume, name: "abc", user_id: @user.id)
    allow(request.env['warden']).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)

    allow(@user).to receive(:resumes).and_return([@resume])
    allow(controller).to receive(:current_user_resume).and_return(@resume)
    allow(@user2).to receive(:resumes).and_return([])

  end

  it "should #index access for @user" do
    get :index
    expect(assigns(:resumes)).to eq([@resume])
  end

  it "should #edit access for @user" do
    get :edit, params: {id: @resume.id}
    expect(response.status).to eq(200)
  end

  it "should #update access for @user" do
    expect(@resume).to receive(:update_attributes).and_return(true)
    patch :update, params: {id: @resume.id, resume: {name: "abc"}}
    expect(response).to redirect_to(resumes_url)
  end

  it "should #destroy access for @user" do
    expect(@resume).to receive(:delete).and_return(true)
    delete :destroy, params: {id: @resume.id, format: "script"}
    expect(response.status).to eq(200)
  end
end
