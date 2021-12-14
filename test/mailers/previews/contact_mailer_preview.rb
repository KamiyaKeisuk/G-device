# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact
    contact = Contact.new(email: "test@test.com", name: "令和 太郎", title: "デバイス追加について", message: "RazerのViper Miniの追加をお願いします。")
    ContactMailer.send_mail(contact)
  end
end
