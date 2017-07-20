require "rails_helper"

describe 'post a review exception route', :type => :request do
  before do
    destination = Destination.create(location: 'Spella', id: 1)
    post "/destinations/#{destination.id}/reviews", params: { :author => 'Test Dana' }
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
