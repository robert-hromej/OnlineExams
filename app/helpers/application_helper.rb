module ApplicationHelper

  def admin?
    current_user.has_admin?
  end

  def record_errors
    unless @errors.blank?
      render :partial => "layouts/record_errors", :locals => {:errors => @errors}
    end
  end

end

