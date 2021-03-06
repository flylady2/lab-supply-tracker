

class AdminMailer < ApplicationMailer
  default from: 'Lab Supply Tracker'

  def new_user_notification_email
    @user = params[:new_user]
    @lab = params[:lab]
    mail(to: @lab.admin_emails, subject: "New user signed up for Lab Supply Tracker.")
  end


  def trigger_email
    @reagent = params[:reagent]
    @lab = params[:lab]
    mail(to: @lab.admin_emails, subject: "A reagent needs to be ordered.")
  end



  def ask_email
    @user = params[:user]
    @name = params[:name]
    @lab = params[:lab]
    mail(to: @lab.admin_emails, subject: "A reagent has been requested.")
  end
end
