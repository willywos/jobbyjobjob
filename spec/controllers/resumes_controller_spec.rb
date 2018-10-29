require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  before (:all) do
    @user = User.create(email: "example@test.com", password: "password", password: "password" )
    @user2 = User.create(email: "example2@test.com", password: "password", password: "password" )
    @resume = Resume.create(name: "abc", user_id: @user.id)
  end


  it "testes #index access for @user" do 
    sign_in @user
    get :index
    expect(assigns(:resumes)).to eq([@resume])
  end

  it "testes #index access for @user2" do 
    sign_in @user2
    get :index
    expect(assigns(:resumes)).to eq([])
  end

  it "testes #edit access for @user" do 
    sign_in @user
    get :edit, params: {id: @resume.id}
    expect(response.status).to eq(200)
  end

  it "testes #edit access for @user2 - redirected" do 
    sign_in @user2
    get :edit, params: {id: @resume.id}
    expect(response.status).to eq(302)
  end

  it "testes #update access for @user" do 
    sign_in @user
    patch :update, params: {id: @resume.id, resume: {name: "abc"}}
    expect(response).to redirect_to(resumes_url) 
  end

  it "testes #update access for @user2 - redirected" do 
    sign_in @user2
    patch :update, params: {id: @resume.id, resume: {name: "abc"}}
    expect(response).to redirect_to(root_url) 
  end

  it "testes #destroy access for @user" do 
    sign_in @user
    delete :destroy, params: {id: @resume.id, format: "script"}
    expect(response.status).to eq(200)
  end

  it "testes #destroy access for @user2 - redirected" do 
    sign_in @user2
    delete :destroy, params: {id: @resume.id, format: "script"}
    expect(response.status).to eq(302)
  end

end
