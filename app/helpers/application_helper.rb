module ApplicationHelper

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end


    def logged_in
      !!current_user
    end

  def go_home
    @lab = Lab.find(@current_user.lab_id)
    link_to "Lab Home Page", lab_path(@lab)
  end

  #def logged_in?
    #!!@current_user
  #end
end
