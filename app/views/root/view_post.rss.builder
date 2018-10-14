xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "JobbyJobJob Jobs Feed"
    xml.description "An aggregate of job postings from 5 major job boards"
    xml.link view_post_url(@posting)
    posting_as_xml(xml, @posting)
  end
end