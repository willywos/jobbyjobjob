require 'rails_helper'
require 'jobby_job_job/we_work_remotely_parser'

RSpec.describe WeWorkRemotelyParser do

  before(:each) do
    @parser = WeWorkRemotelyParser.new
  end

  it 'should get the company name from the title' do
    expect(@parser.get_company_from_title('Blockit, Inc.: Integration Engineer')).to eq('Blockit, Inc.')
    expect(@parser.get_company_from_title('SMTP2GO: Fullstack Developer')).to eq('SMTP2GO')
  end
end
