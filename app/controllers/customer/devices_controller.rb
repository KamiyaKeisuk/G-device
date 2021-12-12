class Customer::DevicesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @devices = Device.page(params[:page]).per(12)
    #選択したカテゴリーのデバイス一覧
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @devices = @category.devices.page(params[:page]).per(12)
    #選択したメーカーのデバイス一覧
    elsif
      params[:maker_id].present?
      @maker = Maker.find(params[:maker_id])
      @devices = @maker.devices.page(params[:page]).per(12)
    end
  end

  def show
    @device = Device.find(params[:id])
  end
end
