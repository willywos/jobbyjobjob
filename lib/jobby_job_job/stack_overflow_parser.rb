require 'feedjira'
require 'jobby_job_job/job_parser'

class StackOverflowParser < JobParser
  def initialize
  end

  def process(data)
    data.map! { |item|
      {
        title: get_title(item.title),
        description: sanitize_html(item.summary),
        publish_date: item.published,
        company: get_company_from_title(item.title),
        url: item.url,
        logo: "",
        job_board: "StackOverflow"
      }
    }
  end

  def get_title(title)
    title.split(" at").first()
  end

  def get_company_from_title(title)
    title[/at (.*) \(/, 1]
  end
end
