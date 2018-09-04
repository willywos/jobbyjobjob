require 'jobby_job_job/posting_processor'

namespace :jobby_job do
  desc "Parses job sites"
  task process_job_sites: :environment do
    puts "🤞 Processing Job Postings"
    JobbyJobJob::PostingProcessor.new.process!
    puts "🍻 Processing Job Postings Completed"
  end

  desc "Clears out all job postings"
  task clear_job_sites: :environment do
    puts "🤞 Clearing Job Postings"
    JobbyJobJob::PostingProcessor.new.delete_all!
    puts "🍻 Clearing Job Postings Completed"
  end
end
