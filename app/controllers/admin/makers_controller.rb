class Admin::MakersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @maker = Maker.new
    @makers = Maker.all
  end

  def create
    @maker = Maker.new(maker_params)
    @maker.save
    redirect_to admin_makers_path
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      redirect_to admin_makers_path
    else
      redirect_to request.referer
    end
  end

  private
    def maker_params
      params.require(:maker).permit(:name)
    end
end
