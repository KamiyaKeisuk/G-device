class Customer::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @search = Device.ransack(params[:q])
    @devices = @search.result.page(params[:page]).per(10)
  end
end
