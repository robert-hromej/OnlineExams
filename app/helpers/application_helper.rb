module ApplicationHelper

  def admin?
    current_user.has_admin?
  end

  def record_errors
    unless @errors.blank?
      render :partial => "layouts/record_errors", :locals => {:errors => @errors}
    end
  end

  def flash_messages
    html = ""
    flash.each do |key, msg|
      html << content_tag(:div, msg, :id => "flash_#{key}") if msg.is_a?(String)
    end
    flash.clear
    html.html_safe
  end

  def js_flash_messages
    replace_html("sys_messages", flash_messages)
  end

  def replace_html(id, str)
    "$('##{id}').html('#{escape_javascript(str)}');".html_safe
  end

end

