Given /^a level exists with attached level file "([^"]*)"$/ do |file_name|
  level = Level.create! name: "my kodu file", level_file: fixture_file_upload(file_name, 'application/octet-stream')
end
