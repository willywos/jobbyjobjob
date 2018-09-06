require 'jobby_job_job/request'
require 'jobby_job_job/response'
require 'jobby_job_job/parser'

module JobbyJobJob
  class PostingProcessor
    attr_accessor :job_sites

    def initialize
      @job_sites = [
        {
          url:"https://remoteok.io/remote-dev-jobs.json",
          format:"json",
          parser:"RemoteOk"
        },
        {
          url:"https://jobs.github.com/positions.json?location=Remote",
          format:"json",
          parser:"GithubJob"
        },
        {
          url:"https://weworkremotely.com/categories/remote-programming-jobs.rss",
          format:"rss",
          parser:"WeWorkRemotely"
        },
        {
          url:"http://rss.indeed.com/rss?q=programmer%2C+web+developer%2C+developer%2C+ruby%2C+go%2C+linux%2C+aws%2C+rails&l=Remote",
          format:"rss",
          parser:"Indeed"
        }
      ]
    end

    def process!
      @job_sites.each do |job_site|
        res = JobbyJobJob::Request.new.request_get(job_site[:url])
        parser = JobbyJobJob::Parser.new(res, job_site)
        parser.process_mapping!
      end
      PgSearch::Multisearch.rebuild(JobPosting, false)
    end

    def delete_all!
      JobPosting.delete_all
    end
  end
end
