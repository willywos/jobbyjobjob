module ApplicationHelper
  def posting_as_xml(xml, job_posting)
    xml.item do
      xml.title job_posting.title
      xml.logo job_posting.logo
      xml.description job_posting.description
      xml.publish_date job_posting.publish_date
      xml.company job_posting.company
      xml.job_board job_posting.job_board
      xml.url job_posting.url
    end
  end
end
