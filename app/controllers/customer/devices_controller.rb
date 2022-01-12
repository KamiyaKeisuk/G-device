class Customer::DevicesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @devices = Device.page(params[:page]).per(12)
    # 選択したカテゴリーのデバイス一覧
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @devices = @category.devices.page(params[:page]).per(12)
    # 選択したメーカーのデバイス一覧
    elsif params[:maker_id].present?
      @maker = Maker.find(params[:maker_id])
      @devices = @maker.devices.page(params[:page]).per(12)
    # 新着順、登録順に並び替え
    elsif params[:keyword].present?
      selection = params[:keyword]
      @devices = Device.sort(selection).page(params[:page]).per(12)
    end
  end

  def show
    @device = Device.find(params[:id])
    @reviews = @device.reviews.all
    # いいね順、新着順 並び替え機能
    if params[:keyword].present?
      case params[:keyword]
      when 'likes'
        @reviews = @device.reviews.includes(:liked_customers).sort {|a,b| b.liked_customers.size <=> a.liked_customers.size}
      when 'new'
        @reviews = @device.reviews.all.order(created_at: :desc)
      end
    end
  end
end
