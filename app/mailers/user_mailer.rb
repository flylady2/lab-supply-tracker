class UserMailer < ApplicationMailer


  def welcome_email
    @new_user = params[:new_user]
    mail(to: @new_user.email, subject: 'Welcome to Lab Supply Tracker')
  end


end
