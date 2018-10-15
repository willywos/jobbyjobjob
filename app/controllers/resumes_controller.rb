class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_resume, only: [:edit, :update, :destroy]

  def index
    @resumes = current_user.resumes
  end

  def new
    @resume = Resume.new(user_id: current_user.id)  
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to resumes_path and return
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @resume.update_attributes(resume_params)
      redirect_to resumes_path and return
    else
      render :edit
    end
  end

  def destroy
    @resume.delete
  end


  private

  def load_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    new_params = params.require(:resume).permit(:name, :user_id, data: {})
    new_params[:resume][:data] = new_params[:resume][:data].to_h if new_params[:resume].try(:[], :data).present?
    new_params
  end
end
