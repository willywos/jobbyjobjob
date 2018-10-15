require 'date'
require 'jobby_job_job/job_parser'

class GithubJobParser < JobParser

  def process(data)
    data.map! { |item|
      {
        title: item["title"],
        description: item["description"],
        publish_date: item["created_at"],
        company: item["company"],
        company_slug: item["company"].parameterize,
        url: item["url"],
        logo: item["company_logo"],
        job_board: "GitHub"
      }
    }
  end
end
