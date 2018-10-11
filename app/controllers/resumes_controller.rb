class ResumesController < ApplicationController
  before_action :authenticate_user!

  def index
    @resumes = current_user.resumes
  end
end
