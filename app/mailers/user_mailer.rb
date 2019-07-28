class UserMailer < ApplicationMailer


  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def trigger_email
    @user = params[:user]
    @reagent = params[:reagent]
    mail(to: @user.email, subject: "This reagent needs to be ordered.")
  end
end
