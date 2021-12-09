class Customer::DevicesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @devices = Device.page(params[:page]).per(12)
  end

  def show
    @device = Device.find(params[:id])
    @reviews = @device.reviews
  end
end
