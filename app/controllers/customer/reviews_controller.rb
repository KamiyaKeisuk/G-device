class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reviews = current_customer.reviews.page(params[:page]).per(10).order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def show
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
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
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
    # レビューを作成した人以外がurlに直接打ち込んでもそのページにアクセスできない記述
    if @review.customer == current_customer
      render "edit"
    else
      redirect_to device_path(@device)
    end
  end

  def update
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to device_review_path(@device)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
    # レビューを作成した人以外が削除できない記述
    if @review.customer == current_customer
      @review.destroy
      redirect_to device_path(@device)
    else
      redirect_to request.referer
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :rate, :image)
  end
end
