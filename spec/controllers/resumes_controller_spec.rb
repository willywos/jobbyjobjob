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

  it "testes #edit access for @user2" do 
    sign_in @user2
    get :edit, params: {id: @resume.id}
    expect(response.status).to eq(302)
  end

end
