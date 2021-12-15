class Admin::DevicesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @devices = Device.page(params[:page]).per(10)
    #選択したカテゴリーのデバイス一覧
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @devices = @category.devices.page(params[:page]).per(10)
    #選択したメーカーのデバイス一覧
    elsif
      params[:maker_id].present?
      @maker = Maker.find(params[:maker_id])
      @devices = @maker.devices.page(params[:page]).per(10)
    end
  end

  def new
    @device = Device.new
    @categories = Category.all
    @makers = Maker.all
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to admin_device_path(@device)
    else
      redirect_to request.referer
    end
  end

  def show
    @device = Device.find(params[:id])
  end

  def edit
    @device = Device.find(params[:id])
    @categories = Category.all
    @makers = Maker.all
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to admin_device_path(@device)
    else
      redirect_to request.referer
    end
  end

  private
    def device_params
      params.require(:device).permit(:category_id, :maker_id, :name, :description, :price, :image)
    end
end
