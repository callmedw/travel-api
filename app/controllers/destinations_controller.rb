class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    @destination = Destination.create(destination_params)
    json_response(@destination)
  end
  # def create
  #   @destination = Destination.find(params[:id])
  #   @review = @destination.review.create(review_params)
  #   json_response(@review.destination)
  # end
  #
  # def update
  #   @destination = Destination.find(params[:id])
  #   @destination.update(destination_params)
  # end
  #
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private
  def json_response(object)
    render json: object.as_json(include: :reviews), status: :ok
  end

  def destination_params
    params.require(:destination).permit(:destination)
  end

  # def review_params
  #    params.require(:review).permit(:author, :body, :rating)
  # end
end
