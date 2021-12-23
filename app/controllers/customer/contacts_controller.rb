class Customer::ContactsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to complete_contacts_path
    else
      redirect_to request.referer
    end
  end

  def complete
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :message)
  end
end
