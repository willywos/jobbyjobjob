class SavedJob < ApplicationRecord
  belongs_to :user
  belongs_to :job_posting
  validates_uniqueness_of :user_id, scope: :job_posting_id, message: 'You cannot save the same job twice!'
end
