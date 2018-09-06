require 'rails_helper'
require 'jobby_job_job/github_job_parser'

RSpec.describe GithubJobParser do

  before(:each) do
    @parser = GithubJobParser.new
  end

  it 'should map the attributes from github to jobby job job' do
    items = [
      {
        "title" => "Job Title",
        "description" => "<p><br><b>This is a great job</b> and a <h1>great company</h1> to work for.</p>",
        "created_at" => "04/20/1980",
        "company" => "GitHub",
        "url" => "https://github.com/jobs/129309233",
        "company_logo" => "https://github.com/logos/1.png"
      }
    ]
    data = @parser.process(items).first
    expect(data[:title]).to eq("Job Title")
    expect(data[:description]).to eq("This is a great job and a great company to work for.")
    expect(data[:publish_date]).to eq("04/20/1980")
    expect(data[:company]).to eq("GitHub")
    expect(data[:url]).to eq("https://github.com/jobs/129309233")
    expect(data[:logo]).to eq("https://github.com/logos/1.png")
  end
end
