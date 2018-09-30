require 'date'
require 'jobby_job_job/job_parser'

class GithubJobParser < JobParser

  def process(data)
    data.map! { |item|
      {
        title: item["title"],
        description: sanitize_html(item["description"]),
        publish_date: item["created_at"],
        company: item["company"],
        url: item["url"],
        logo: item["company_logo"],
        job_board: "GitHub"
      }
    }
  end
end
