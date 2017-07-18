require 'rails_helper'
describe "delete destination route", :type => :request do

  before do
    destination = Destination.create(location: 'test', id: 1)
    delete "/destinations/#{destination.id}"
  end

  it 'destroys destination' do
    expect(response).to have_http_status 204
  end
end
