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
          url:"http://rss.indeed.com/rss?q=Ruby,Rails,Go,Java,JavaScript,FrontEnd,Backend,Node,React,SQL,React+Native,DevOps,Full+Stack,Programmer,Programming,Developer,Web+Developer&l=Remote",
          format:"rss",
          parser:"Indeed"
        },
        {
          url:"https://jobs.github.com/positions.json?location=Remote",
          format:"json",
          parser:"GithubJob"
        },
        {
          url:"https://remoteok.io/remote-dev-jobs.json",
          format:"json",
          parser:"RemoteOk"
        },
        {
          url:"https://stackoverflow.com/jobs/feed?r=true",
          format:"rss",
          parser:"StackOverflow"
        }
      ]
    end

    def process!
      @job_sites.each do |job_site|
        res = JobbyJobJob::Request.new.request_get(job_site[:url])
        parser = JobbyJobJob::Parser.new(res, job_site)
        parser.process_mapping!
      end
      JobPosting.where('publish_date < ?', 1.month.ago).delete_all
      PgSearch::Multisearch.rebuild(JobPosting)
    end

    def delete_all!
      JobPosting.delete_all
    end
  end
end
