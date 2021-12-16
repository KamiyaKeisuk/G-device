class Customer::ReviewCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @review = Review.find(params[:review_id])
    @review_comment = ReviewComment.new(review_comment_params)
    @review_comment.review_id = @review.id
    @review_comment.customer_id = current_customer.id
    if @review_comment.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
  end
  
  private
    def review_comment_params
      params.require(:review_comment).permit(:comment)
    end
end
