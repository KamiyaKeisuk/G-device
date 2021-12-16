class Customer::ReviewLikesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.new(customer_id: current_customer.id)
    review_like.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:review_id])
    review_like = @review.review_likes.find_by(customer_id: current_customer.id)
    review_like.destroy
    redirect_to request.referer
  end
end
