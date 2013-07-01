# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(',')
   unless html_tag =~ /^<label/
    %(<div class="field_with_errors">#{html_tag}<span class="help-inline">&nbsp;#{errors}</span></div>).html_safe
    else
    %(<div class="field_with_errors">#{html_tag}</div>).html_safe
      
  end
end