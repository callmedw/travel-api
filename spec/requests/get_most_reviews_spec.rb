require 'rails_helper'

describe "get search route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    review = Review.create(author: 'Sway', body: 'test review', rating: 2, destination_id: 1)
    get '/destinations/most_reviews'
  end

  it 'returns destination with most reviews' do
    expect(JSON.parse(response.body).size).to eq 1
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
