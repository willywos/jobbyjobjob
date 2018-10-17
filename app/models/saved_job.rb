class SavedJob < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting
  validates_uniqueness_of :user_id, scope: :job_posting_id, message: 'You cannot save the same job twice!'
  
  after_create :save_job_posting_state
  
  after_destroy :check_job_posting_state
  
  # Update the job posting with the saved state set to true
  def save_job_posting_state
    job_posting.update(is_saved: true)
  end
  
  # Check if there are any saved jobs for the same job posting
  # Change the job posting with saved state to false if there aren't any
  def check_job_posting_state
    if SavedJob.where(:job_posting_id => job_posting_id).empty?
      job_posting.update(is_saved: false)
    end
  end
end

