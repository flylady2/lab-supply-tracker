class LabsController < ApplicationController

  before_action :require_admin, only: [:admin]

  def admin
    @lab = Lab.find_by(params[:lab_id])
    require_membership
  end

  def show
    @lab = Lab.find(params[:id])
    require_membership
  end

  private
  def lab_params
    params.require(:lab).permit(:principal_investigator, :institution)
  end



end
