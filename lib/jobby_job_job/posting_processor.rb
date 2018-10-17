require 'jobby_job_job/request'
require 'jobby_job_job/response'
require 'jobby_job_job/parser'

module JobbyJobJob
  class PostingProcessor
    attr_accessor :job_sites

    def initialize
      @job_sites = [
          {
          url:"https://weworkremotely.com/categories/remote-programming-jobs.rss",
          format:"rss",
          parser:"WeWorkRemotely"
        },
        {
          url:"http://rss.indeed.com/rss?q=title:Programmer,Ruby,Rails,Golang,Python,Java,JavaScript,Node,SQL,DevOps&l=Remote&sort=date",
          format:"rss",
          parser:"Indeed"
        },
        {
          url:"https://jobs.github.com/positions.json?location=Remote",
          format:"json",
          parser:"GithubJob"
        },
        {
          url:"https://stackoverflow.com/jobs/feed?r=true",
          format:"rss",
          parser:"StackOverflow"
        },

        {
          url:"https://remoteok.io/remote-dev-jobs.json",
          format:"json",
          parser:"RemoteOk"
        }
      ]
    end

    def process!
      @job_sites.each do |job_site|
        res = JobbyJobJob::Request.new.request_get(job_site[:url])
        parser = JobbyJobJob::Parser.new(res, job_site)
        parser.process_mapping!
      end
      # Delete all unsaved jobs published a month back
      JobPosting.unsaved.where('publish_date < ?', 1.month.ago).delete_all
      PgSearch::Multisearch.rebuild(JobPosting)
    end

    def delete_all!
      # Delete all unsaved jobs
      JobPosting.unsaved.delete_all
    end
  end
end

