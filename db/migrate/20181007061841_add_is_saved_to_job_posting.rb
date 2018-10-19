class AddIsSavedToJobPosting < ActiveRecord::Migration[5.2]
  def change
    add_column :job_postings, :is_saved, :boolean, :default => false
  end
end

