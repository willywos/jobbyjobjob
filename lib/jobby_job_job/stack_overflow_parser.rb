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
    title.split(" at").first().gsub("(Remote)", "")
  end

  def get_company_from_title(title)
    str_arr = title.split(' at ', 2)
    str_arr[1].split(' (')[0]
  end
end
