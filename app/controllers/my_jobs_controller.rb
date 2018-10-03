class MyJobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_jobs = current_user.job_postings.paginate(page: params[:page])
  end
end
