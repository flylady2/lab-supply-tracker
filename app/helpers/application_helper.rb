module ApplicationHelper

  def go_home
    @lab = Lab.find(@current_user.lab_id)
    link_to "Lab Home Page", lab_path(@lab)
  end
end
