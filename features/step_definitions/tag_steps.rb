Given /^There is an assignment$/ do
  @assignment = Factory :assignment
end

Then /^I should be able to upload levels with tags$/ do
  visit new_assignment_level_path(@assignment)
  fill_in 'Name', with:'my level'
  fill_in 'Description', with: 'new level with tags'
  path = Rails.root.join('features','input_files','example_level.kodu')
  attach_file('level_level_file', path)
  click_button 'Create Level'
 end

When /^I edit my level with a tag$/ do
  pending #do we allow students to add tags to already uploaded levels??
end

Then /^I will see my tags$/ do
  pending # express the regexp above with the code you wish you had
end

