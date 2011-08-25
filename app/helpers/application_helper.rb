module ApplicationHelper

  def admin?
    current_user.has_admin?
  end

end

