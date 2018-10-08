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

    def find_job_posting_by_url(url)
      JobPosting.where(url: url).first
    end

    def find_job_posting_by_title(title, company)
      JobPosting.where(company: company).where("title ILIKE ? OR title = ?", "%#{title}%", title).first
    end

    def is_already_posted?(job)
      !find_job_posting_by_url(job[:url]).blank? ||
      !find_job_posting_by_title(job[:title], job[:company]).blank?
    end

    def process_mapping!
      parsed_data = parse_body
      unless parsed_data.blank?
        @parser.process(parsed_data).each do |job|
          unless job.blank?
            #puts "company: #{job[:company]} | title: #{job[:title]} is_already_posted?(job):#{is_already_posted?(job)}"
            JobPosting.create!(job) unless is_already_posted?(job)
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
