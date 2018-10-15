class AddCompanySlugToJobs < ActiveRecord::Migration[5.2]
  def up
    add_column :job_postings, :company_slug, :string

    JobPosting.all.each do |job_posting|
      job_posting.
        update_attribute(:company_slug, job_posting.company&.parameterize)
    end
  end

  def down
    remove_column :job_postings, :company_slug
  end
end
