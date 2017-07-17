class DestinationsController < ApplicationController

  def index
    @destinations = {"destination": "Susha says the destination is your mom's house."}
    json_response(@destinations)
  end

  private
  def json_response(object)
    render json: object, status: :ok
  end
end
