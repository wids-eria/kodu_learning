ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  %(<div class="control-group error"><div class="controls">#{html_tag}</div></div>).html_safe
end
