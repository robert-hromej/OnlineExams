class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_access!
    unless current_user.has_admin?
      flash[:alert] = t('alert.dont_access_level')
      redirect_to root_path
    end
  end

end
