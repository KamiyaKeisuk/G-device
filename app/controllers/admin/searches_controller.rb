class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @search = Device.ransack(params[:q])
    @devices = @search.result.page(params[:page]).per(10)
  end
end
