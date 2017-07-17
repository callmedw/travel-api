class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    json_response(@destination.reviews)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.create(review_params)
    json_response(@review.destination, :created)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end
  
  private
  def json_response(object, status = :ok)
    render json: object, status: :ok
  end

  def review_params
    params.permit(:author, :body, :rating)
  end
end
