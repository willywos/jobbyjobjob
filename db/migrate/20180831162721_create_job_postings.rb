class CreateJobPostings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.datetime :publish_date
      t.string :company
      t.string :url
      t.string :logo
      t.timestamps
    end
  end
end
