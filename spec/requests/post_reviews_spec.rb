require 'rails_helper'

describe "post review route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    post "/destinations/#{destination.id}/reviews", params: { author: 'Sway', body: 'test review', rating: 2, destination_id: 1 }
  end

  it 'returns the review' do
    expect(JSON.parse(response.body)['location']).to eq "test"
  end

  it 'returns created status' do
    expect(response).to have_http_status 201
  end
end
