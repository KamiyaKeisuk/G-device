class Customer::HomesController < ApplicationController
  before_action :authenticate_customer!, only: :recommend

  def top
  end

  def about
  end

  def recommend
    @customer = current_customer.id
    #@customerがレビューした投稿
    @reviews = Review.where(customer_id: @customer).order(created_at: :desc)
    if @reviews.exists?
      #review = @customerがレビューしているデバイスの最新1つ
      review = @reviews.last
      #device = reviewのdevice_idが含まれるdevice
      device = review.device
      #maker_recommend = deviceと同じmaker
      maker_recommend = Maker.find_by(name: device.maker.name)
      #device_recommend = maker_recommendと同じdeviceを全て
      device_recommend = maker_recommend.devices
        #レビューしたdevice全てのdevice.id
      x = [] #xに配列を代入できるようにする
      @reviews.each do |review|
        x << review.device_id #xにreview.device_idを全て代入して配列にする
      end
      #review_recommend = device_recommendの中で@customerがレビューしていないdeviceの最新4つ
      @review_recommend = device_recommend.where.not(id: x).last(4)
    else
      #@customerがレビューしていない場合deviceをランダムに4つ
      rand = Rails.env.production? ? "rand()" : "RANDOM()"
      @review_recommend = Device.order(rand).limit(4)
    end
  end
end
