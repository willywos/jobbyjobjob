require 'date'
require 'jobby_job_job/job_parser'

class RemoteOkParser < JobParser
  def initialize
  end

  def process(data)
    data.map! { |item|
      {
        title: item["position"],
        description: sanitize_html(item["description"]),
        publish_date: Time.at(item["epoch"].to_i).to_datetime.to_s,
        company: item["company"],
        url: item["url"],
        logo: item["logo"],
        job_board: "RemoteOk"
      } if item["legal"].blank?
    }
  end
end
