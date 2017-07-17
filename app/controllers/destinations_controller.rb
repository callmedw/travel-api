class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  # def create
  #   @quote = Quote.create(quote_params)
  #   json_response(@quote)
  # end
  #
  # def update
  #   @quote = Quote.find(params[:id])
  #   @quote.update(quote_params)
  # end
  #
  # def destroy
  #   @quote = Quote.find(params[:id])
  #   @quote.destroy
  # end

  private
  def json_response(object)
    render json: object.as_json(include: :reviews), status: :ok
  end
end
