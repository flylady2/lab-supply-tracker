# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview


  def new_user_notification_email
    AdminMailer.with(user: User.first, lab: Lab.first).new_user_notification_email
  end
end
