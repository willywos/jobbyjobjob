require 'rails_helper'
require 'jobby_job_job/html_to_plain_text'

RSpec.describe JobbyJobJob::HtmlToPlainText do

  before(:each) do
    @parser = JobbyJobJob::HtmlToPlainText.new
    @html = "<p>Lenox Park Solutions is seeking a PHP Engineer with 2-5 years of commercial experience. As a PHP Engineer, you would work closely with our Development team to code and test functionality which will directly increase the scalability of RoundTables, our flagship product which will disrupt and revitalize the Asset Management industry. The junior developer will work directly with a team of experienced engineers to execute platform development, and will have the opportunity to grow within the organization. At LPS, we focus on accountability, proactiveness, and creative thinking. Staff members retain the option to work remotely, as we are a goals-oriented team.</p><br /><ul><br /><li><strong>Requirements</strong>:</li><br /><ul><br /><li>Professional experience on PHP, specifically with Laravel, VueJS/ReactJS, and Git, and preferably with Laravel Queues, Websockets, Amazon Web Services, Linux (Ubuntu), Phpunit and API development;</li><br /><li>Outstanding communication skills, both verbal and written experience with technical and non-technical audiences;</li><br /><li>Ability to assess ongoing processes critically and recommend creative, thoughtful operational improvements;</li><br /></ul><br /><li><strong>Preferred Skills</strong>:</li><br /><ul><br /><li>Understanding of Asset Management industry;</li><br /><li>Business-oriented, highly analytical mind with a knack for accounting for both complex business and technical considerations simultaneously</li><br /></ul><br /></ul>"
  end

  it 'should do something' do
    expect(@parser.convert_to_text(@html)).to eq('Lenox Park Solutions is seeking a PHP Engineer with 2-5 years of
commercial experience. As a PHP Engineer, you would work closely
with our Development team to code and test functionality which
will directly increase the scalability of RoundTables, our
flagship product which will disrupt and revitalize the Asset
Management industry. The junior developer will work directly with
a team of experienced engineers to execute platform development,
and will have the opportunity to grow within the organization. At
LPS, we focus on accountability, proactiveness, and creative
thinking. Staff members retain the option to work remotely, as we
are a goals-oriented team.

* Requirements:

* Professional experience on PHP, specifically with Laravel,
VueJS/ReactJS, and Git, and preferably with Laravel Queues,
Websockets, Amazon Web Services, Linux (Ubuntu), Phpunit and API
development;

* Outstanding communication skills, both verbal and written
experience with technical and non-technical audiences;

* Ability to assess ongoing processes critically and recommend
creative, thoughtful operational improvements;

* Preferred Skills:

* Understanding of Asset Management industry;

* Business-oriented, highly analytical mind with a knack for
accounting for both complex business and technical considerations
simultaneously'
        )
  end
end
