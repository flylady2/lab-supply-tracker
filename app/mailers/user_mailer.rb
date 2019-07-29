class UserMailer < ApplicationMailer


  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def trigger_email
    @user = params[:user]
    @reagent = params[:reagent]
    @lab = params[:lab]
    mail(to: @lab.users.where(admin: true).pluck(:email), subject: "This reagent needs to be ordered.")
  end
end
