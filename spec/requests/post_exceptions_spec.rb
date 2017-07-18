require 'rails_helper'

describe "post destination route", :type => :request do

  before do
    post '/destinations', params: { :location => ""}
  end

  it 'returns the location' do
    expect(JSON.parse(response.body)['message']).to eq "Validation failed: Location can't be blank"
  end

  it 'returns created status' do
    expect(response).to have_http_status :unprocessable_entity
  end
end
