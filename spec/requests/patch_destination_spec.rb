require 'rails_helper'

describe "patch destinations route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    patch "/destinations/#{destination.id}", params: { location: 'Portland' }
  end

  it 'returns all reviews' do
    expect(JSON.parse(response.body)['message']).to eq "Updated yo."
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end
end
