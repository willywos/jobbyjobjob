require 'rails_helper'
require 'jobby_job_job/indeed_parser'

RSpec.describe IndeedParser do

  before(:each) do
    @parser = IndeedParser.new
  end

  it 'should get the company name from the title' do
    expect(@parser.get_company_from_title('Senior Data Scientist - FireEye - Remote')).to eq('FireEye')
    expect(@parser.get_company_from_title('Eastern Region Vice President, MNA - Manitou Group - Remote')).to eq('Manitou Group')
  end
end
