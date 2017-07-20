require 'rails_helper'

describe 'get a destination route', :type => :request do

  before do
    get '/destinations/31'
  end

  it 'returns an error if no destination is found' do
    expect(response).to have_http_status(:not_found)
  end
end
