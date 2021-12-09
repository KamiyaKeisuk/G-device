class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @review = Review.new
  end

  def create
    @device = Device.find(params[:device_id])
    @review = Review.new(review_params)
    @review.device_id = @device.id
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to device_path(@device)
    else
      redirect_to request.referer
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(:title, :comment, :rate, :image)
    end
end
