class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @contacts = Contact.page(params[:page]).per(10)
  end
end
