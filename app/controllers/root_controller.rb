class RootController < ApplicationController
  before_action :authenticate_user!, only: [:save_job]

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

  def save_job
    job_posting = JobPosting.find_by(id: params[:id])
    saved_job = SavedJob.new(user_id: current_user.id, job_posting_id: job_posting.id)
    if saved_job.save
      flash[:notice] = "Job Was Successfully Saved!"
    else
      flash[:alert] = saved_job.errors.full_messages.join(',')
    end

    redirect_to root_path
  end

  def remove_job
    current_user.saved_jobs.find_by(job_posting_id: params[:id]).destroy
    flash[:notice] = "Job Was Successfully Removed!"

    redirect_back(fallback_location: root_path)
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
    @job_postings = if params[:query].blank? 
                      JobPosting.paginate(page: params[:page]).order("publish_date desc") 
                    else 
                      JobPosting.search_by_title(params[:query]).paginate(page: params[:page]).reorder("publish_date desc")
                    end
  end
end
