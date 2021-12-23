class Admin::ReviewsController < ApplicationController
  def show
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:device_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_device_path(@device)
  end
end
