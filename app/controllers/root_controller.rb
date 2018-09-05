class RootController < ApplicationController
  def index
    @job_postings = JobPosting.all.order("publish_date desc")
  end

  def about
  end
end
