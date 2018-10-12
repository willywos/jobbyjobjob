class ResumesController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    @resume = Resume.find(params[:id])
    @resume.delete
  end


  private

  def resume_params
    params.require(:resume).permit(:name, :user_id, :data)
  end
end
