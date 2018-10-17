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
  end

  describe '#is_already_posted?' do

    it 'returns true when the job posting is found by url' do
      allow(@parser).to receive(:find_job_posting_by_url).and_return(true)
      allow(@parser).to receive(:find_job_posting_by_title).and_return(false)
      expect(@parser.is_already_posted?(
        { :title => "Cds", company:"Test", url:"http://test.com/1234" }
      )).to eq(true)
    end

    it 'returns true when the job posting is found by title' do
      allow(@parser).to receive(:find_job_posting_by_url).and_return(false)
      allow(@parser).to receive(:find_job_posting_by_title).and_return(true)
      expect(@parser.is_already_posted?(
        { :title => "Cds", company:"Test", url:"http://test.com/1234" }
      )).to eq(true)
    end

    it 'returns false when no matching job is found' do
      allow(@parser).to receive(:find_job_posting_by_url).and_return(false)
      allow(@parser).to receive(:find_job_posting_by_title).and_return(false)
      expect(@parser.is_already_posted?(
        { :title => "Cow Pusher", company:"Test" }
      )).to eq(false)
    end
  end
end
