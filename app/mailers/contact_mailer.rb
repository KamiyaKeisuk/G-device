class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: 'G-device お問い合わせ'
  end
end
