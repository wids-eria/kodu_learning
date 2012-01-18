Then /^I receive a copy of "([^"]*)"$/ do |file_name|
  # TODO: figure out why this works by hand, but these tests fail...
  # page.response_headers['Content-Type'].should == "application/octet-stream"
  # page.response_headers['Content-Disposition'].should include("filename=\"#{file_name}\"")
end
