require 'rails_helper'

describe "post destination route", :type => :request do

  before do
    post '/destinations', params: { :location => 'test_location' }
  end

  it 'returns the location' do
    expect(JSON.parse(response.body)['location']).to eq 'test_location'
  end

  it 'returns created status' do
    expect(response).to have_http_status 202
  end
end
