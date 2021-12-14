class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_root_path
  end
end
