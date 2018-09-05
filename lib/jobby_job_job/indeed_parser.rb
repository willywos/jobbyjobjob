require 'feedjira'
require 'jobby_job_job/job_parser'

class IndeedParser < JobParser
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
        logo: item.image.blank? ? "" : item.image
      }
    }
  end

  def get_company_from_title(title)
    title_split = title.split(" - ")
    title_split[(title_split.count - 2)]
  end
end
