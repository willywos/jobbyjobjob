require 'rails_helper'
require 'jobby_job_job/stack_overflow_parser'

RSpec.describe StackOverflowParser do

  before(:each) do
    @parser = StackOverflowParser.new
  end

  it 'should get the company name from the title' do
    expect(@parser.get_company_from_title("Software Development Engineer 2 at Comcast (Cambridge, MA)")).to eq('Comcast')
    expect(@parser.get_company_from_title('Systemadministrator_in at Technische Universit Wien (Wien, Österreich)')).to eq('Technische Universit Wien')
    expect(@parser.get_company_from_title('Backend-utvecklare at Lendo AB (Stockholm, Sweden)')).to eq('Lendo AB')
  end

  it 'should get job from title' do
    expect(@parser.get_title('Engineer, Software Dev & Engineering at Comcast (Reston, VA)')).to eq('Engineer, Software Dev & Engineering')
    expect(@parser.get_title('Front-end React JS Developer at Comcast (Cambridge, MA)')).to eq('Front-end React JS Developer')
    expect(@parser.get_title('Software Developer at Antaris (Limerick, Ireland)')).to eq('Software Developer')
  end
end
