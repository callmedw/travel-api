class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  private
  def json_response(object)
    render json: object.as_json(include: :reviews), status: :ok
  end
end
