class RootController < ApplicationController
  before_action :authenticate_user!, only: [:save_job, :remove_job]

  def index
    load_jobs

    respond_to do |format|
      format.html
      format.js
      format.rss { render layout: false }
      format.json { render json: JSONAPI::Serializer.serialize(@job_postings, is_collection: true) }
    end
  end

  def about
  end

  def view_post
    @posting = JobPosting.find(params[:id])
    respond_to do |format|
      format.html do
        history_item = {id: @posting.id, title: @posting.title}
        session[:viewed_post_history] ||= []
        # preventing duplicates; todo: might be good to move duplicate to the front instead of just ignoring?
        unless session[:viewed_post_history].any? {|h| h["id"] == @posting.id}
          session[:viewed_post_history].unshift(history_item)
        end
      end
      format.json { render json: JSONAPI::Serializer.serialize(@posting) }
      format.rss { render layout: false }
    end
  end

  def view_company
    @job_postings = JobPosting.
      where(company_slug: params[:company_slug]).
      paginate(page: params[:page]).
      order("publish_date desc")
    
    respond_to do |format|
      format.html
      format.json { render json: JSONAPI::Serializer.serialize(@job_postings, is_collection: true) }
      format.rss { render layout: false }
    end
  end

  def save_job
    job_posting = JobPosting.find_by(id: params[:id])
    saved_job = SavedJob.new(user_id: current_user.id, job_posting_id: job_posting.id)
    saved_job.save
     
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def remove_job
    current_user.saved_jobs.find_by(job_posting_id: params[:id]).destroy
    flash[:notice] = "Job Was Successfully Removed!"
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def remove_history_item
    @item = session[:viewed_post_history].detect { |e| e['id'] == params[:id].to_i }
    session[:viewed_post_history].delete(@item)

    respond_to do |format|
      @empty_history_items = session[:viewed_post_history].empty?
      format.js
    end
  end

  private

  def load_jobs
    @job_postings = params[:query].blank? ?
                    JobPosting.paginate(page: params[:page]).order("publish_date desc") :  
                    JobPosting.search_by_title(params[:query]).paginate(page: params[:page]).reorder("publish_date desc")
  end
end
