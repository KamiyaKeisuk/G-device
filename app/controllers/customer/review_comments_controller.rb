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
    @review = Review.find(params[:review_id])
    @review_comment = @review.review_comments.find(params[:id])
    # コメントを作成した人以外が削除できない記述
    if @review_comment.customer == current_customer
      @review_comment.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
