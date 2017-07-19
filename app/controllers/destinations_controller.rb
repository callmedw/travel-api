class DestinationsController < ApplicationController
  # before_action :authenticate_request!

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def search
    location = params[:location]
    @destinations = Destination.search(location)
    json_response(@destinations)
  end

  def most_reviews
    @destinations = Destination.most_reviews
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :accepted)
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "Updated yo."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object.as_json(include: :reviews), status: status
  end

  def destination_params
    params.permit(:location)
  end
end
