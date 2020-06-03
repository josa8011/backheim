module NoticeHelper

  def notice_helper
    app_alert_types = ['danger', 'info', 'success', 'warning']
  
    flash_messages = []
    flash.each do |type, message|
  
    # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
    next if message.nil? or message.blank?
  
    # convert types
    type = 'success' if type == 'notice'
    type = 'danger' if type == 'error' or type == 'alert'
  
    next unless app_alert_types.include?(type)
  
    Array(message).each do |msg|
      next if msg.nil? or msg.blank?
      text = "<div class='alert alert-#{type}'>"
      text += "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
      text += "#{msg.to_s.html_safe}"
      text += "</div>"
  
      flash_messages << text if msg
    end
    end
    flash_messages.join("\n").html_safe
  end
end