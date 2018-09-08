class RootController < ApplicationController


  def index
    @job_postings = JobPosting.all.order("publish_date desc")
  end

  def about
  end

  def search
    @job_postings = params[:query].blank? ? JobPosting.all.order("publish_date desc") : JobPosting.search_sort_by_pub_date(params[:query])
  end

  def view_post
    @posting = JobPosting.find(params[:id])
  end
end
