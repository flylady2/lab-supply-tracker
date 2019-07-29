class UserMailer < ApplicationMailer


  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Lab Supply Tracker')
  end

  def trigger_email
    @user = params[:user]
    @reagent = params[:reagent]
    @lab = params[:lab]
    mail(to: @lab.admin_emails, subject: "This reagent needs to be ordered.")
  end

  def new_user_notification_email
    @user = params[:user]
    #@reagent = params[:reagent]
    @lab = params[:lab]
    mail(to: @lab.admin_emails, subject: "New user signed up for Lab Supply Tracker.")
  end
end
