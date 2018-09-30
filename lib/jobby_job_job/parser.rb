require_relative 'remote_ok_parser'
require_relative 'github_job_parser'
require_relative 'we_work_remotely_parser'
require_relative 'indeed_parser'
require_relative 'stack_overflow_parser'

module JobbyJobJob
  class Parser
    attr_accessor :response, :parser, :job_site
    def initialize(res, job_site)
      @response = res
      @job_site = job_site
      @parser   = to_class(job_site[:parser]).new
    end

    def parse_json
      begin
	       JSON.parse(@response.data)
      rescue
	       {}
      end
    end

    def parse_rss
      begin
        Feedjira::Feed.parse(@response.data).entries
      rescue
	       {}
      end
    end

    def parse_body
      @job_site[:format] == "json" ? parse_json : parse_rss
    end

    def process_mapping!
      @parser.process(parse_body).each do |job|
        unless job.blank?
          job_posting = JobPosting.where(company: job[:company], title: job[:title]).first
          if job_posting.blank?
            JobPosting.create!(job)
          end
        end
      end
    end

    private
      def to_class(clazz)
        titleized_tag = clazz.to_s.titleize.gsub(/\s/,'')
        (titleized_tag + "Parser").constantize
      end
  end
end
