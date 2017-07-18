require 'rails_helper'

describe "delete review route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    review = Review.create(author: 'Sway', body: 'test review', rating: 2, destination_id: 1, id: 1)
    delete "/destinations/#{destination.id}/reviews/#{review.id}"
  end

  it 'destroys review' do
    expect(response).to have_http_status 204
  end
end
