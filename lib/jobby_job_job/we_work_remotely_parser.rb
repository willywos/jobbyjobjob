require 'feedjira'
require 'jobby_job_job/job_parser'

class WeWorkRemotelyParser < JobParser
  def initialize
  end

  def process(data)
    data.map! { |item|
      {
        title: item.title,
        description: sanitize_html(item.summary),
        publish_date: item.published,
        company: get_company_from_title(item.title),
        url: item.url,
        logo: item.image
      }
    }
  end

  def get_company_from_title(title)
    title.split(":").first()
  end
end
