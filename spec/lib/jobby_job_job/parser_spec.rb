require 'rails_helper'
require 'jobby_job_job/parser'
require 'jobby_job_job/response'

RSpec.describe JobbyJobJob::Parser do

  before(:each) do
    @res = JobbyJobJob::Response.new()
    @job_site = {
      url:"https://stackoverflow.com/jobs/feed?r=true",
      format:"rss",
      parser:"StackOverflow"
    }
    @parser = JobbyJobJob::Parser.new(@res, @job_site)
    @job_postings = [
      { title: "Senior Data Scientist", company:"Test" },
      { title: "Sr. Cron Job Runner", company:"Test" },
    ]
  end

  describe '#is_already_posted?' do
    before(:each) do
      allow(JobPosting).to receive_message_chain(:find_matching_by_title, :where).and_return(@job_postings)
    end

    it 'returns true when the job posting is already added' do
      expect(@parser.is_already_posted?(
        { :title => "Senior Scientist", company:"Test" }
      )).to eq(true)
    end

    it 'returns false when no matching job is found' do
      expect(@parser.is_already_posted?(
        { :title => "Cow Pusher", company:"Test" }
      )).to eq(false)
    end
  end
end
