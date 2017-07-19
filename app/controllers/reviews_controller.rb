class ReviewsController < ApplicationController

  def index
    @destination = Destination.find(params[:destination_id])
    json_response(@destination.reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.create(review_params)
    json_response(@review.destination)
  end

  def update
    @review = Review.find(params[:id])
    if current_user && current_user.id == @review.user_id
      @review.update(review_params)
      render status: 200, json: {
        message: "You did it!"
      }
    else
      render status: 401, json: {
        message: "Can't touch this."
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user && current_user.id == @review.user_id
      @review.destroy
      render status: 200, json: {
        message: "You did it!"
      }
    else
      render status: 401, json: {
        message: "Can't touch this."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: :ok
  end

  def review_params
    params.permit(:author, :body, :rating)
  end
end
