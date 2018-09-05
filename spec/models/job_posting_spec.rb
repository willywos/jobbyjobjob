require 'rails_helper'

RSpec.describe JobPosting, type: :model do
  it "should get the initials from the company name" do
    @posting = JobPosting.new({ company:"All Night And LATE" })
    expect(@posting.company_initials).to eq("ANAL")
  end
end
