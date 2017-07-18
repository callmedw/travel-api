require 'rails_helper'

describe "get search route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    get '/destinations/search?location=test'
  end

  it 'returns destinations by location' do
    expect(JSON.parse(response.body)['location']).to eq 'test'
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
