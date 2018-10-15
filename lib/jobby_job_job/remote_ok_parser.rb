require 'date'
require 'jobby_job_job/job_parser'

class RemoteOkParser < JobParser
  def initialize
  end

  def process(data)
    data.map! { |item|
      {
        title: item["position"],
        description: item["description"],
        publish_date: Time.at(item["epoch"].to_i).to_datetime.to_s,
        company: item["company"],
        company_slug: item["company"].parameterize,
        url: item["url"],
        logo: item["logo"],
        job_board: "RemoteOk"
      } if item["legal"].blank?
    } unless data.blank?
  end
end
