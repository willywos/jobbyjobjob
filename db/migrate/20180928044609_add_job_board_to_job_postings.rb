class AddJobBoardToJobPostings < ActiveRecord::Migration[5.2]
  def change
    add_column :job_postings, :job_board, :string
  end
end
