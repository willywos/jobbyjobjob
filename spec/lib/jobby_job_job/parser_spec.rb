require 'rails_helper'
require 'jobby_job_job/parser'

RSpec.describe Parser do

  before(:each) do
    @parser = Parser.new
  end

  it 'check that the job posting is not already added' do
    
    expect(@parser.is_already_posted?('Senior Data Scientist')).to eq('FireEye')
  end
end
