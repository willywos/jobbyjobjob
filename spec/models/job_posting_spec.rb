# == Schema Information
#
# Table name: job_postings
#
#  id           :bigint(8)        not null, primary key
#  title        :string
#  description  :text
#  publish_date :datetime
#  company      :string
#  url          :string
#  logo         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  job_board    :string
#

require 'rails_helper'

RSpec.describe JobPosting, type: :model do

  describe "#company_initials" do
    it "should get the initials from the company name" do
      @posting = JobPosting.new({ company:"All Night And LATE" })
      expect(@posting.company_initials).to eq("ANAL")
    end
  end

  describe "#description_formatted_for_post" do
    it "should remove duplicate <br><br> tags from the job posting" do
      html = "<ul><br><br><li>Write some Ruby!</li></ul>"
      formatted_description = "<ul><li>Write some Ruby!</li></ul>"
      @posting = JobPosting.new({description: html})
      expect(@posting.description_formatted_for_post).to eq(formatted_description)
    end
  end
end
