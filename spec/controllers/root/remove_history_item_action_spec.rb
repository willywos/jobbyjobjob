require 'rails_helper'

describe RootController, '#remove_history_item', type: :controller do

  let(:request_id) { '12' }
  before do
    session[:viewed_post_history] = [{'id' => 12, 'title' => 'Awesome Job'}]
    delete 'remove_history_item', params: { id: request_id }, xhr: true
  end

  it 'response should be js' do
    expect(response.content_type).to eq "text/javascript; charset=utf-8"
  end

  context 'with a valid request id' do
    it 'session should be clean after the action' do
      expect(session[:viewed_post_history]).to be_empty
    end
  end

  context 'with an invalid request id' do
    let(:request_id) { '25' }

    it 'session should be clean after the action' do
      expect(session[:viewed_post_history]).not_to be_empty
    end
  end
end
