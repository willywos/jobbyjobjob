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
  it "should get the initials from the company name" do
    @posting = JobPosting.new({ company:"All Night And LATE" })
    expect(@posting.company_initials).to eq("ANAL")
  end
end
