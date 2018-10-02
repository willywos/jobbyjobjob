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
    history_item = {id: @posting.id, title: @posting.title}
    session[:viewed_post_history] ||= []
    # preventing duplicates; todo: might be good to move duplicate to the front instead of just ignoring?
    unless session[:viewed_post_history].any? {|h| h["id"] == @posting.id}
      session[:viewed_post_history].unshift(history_item)
    end
  end
end
