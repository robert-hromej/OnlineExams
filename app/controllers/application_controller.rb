class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_access!
    unless current_user.has_admin?
      flash[:error] = "You dont access level to this page"
      redirect_to root_path
    end
  end

end
