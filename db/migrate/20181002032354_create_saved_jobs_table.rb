class CreateSavedJobsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_jobs do |t|
      t.integer :user_id, null: false
      t.integer :job_posting_id, null: false
    end
  end
end
