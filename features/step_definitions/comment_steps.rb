Given /^There is an assignment with a level$/ do
  @assignment = Factory :assignment
  @level = Factory :level, assignment: @assignment
end

When /^I visit the assignment$/ do
  visit assignment_path(@assignment)
end

When /^I post a comment$/ do
  # provide a little 'new' anchor on the page too
  click_on 'Comments'
  click_on 'New Comment'
  fill_in 'Body', with: 'xyzxyz'
  click_button 'Create Comment'
end

Then /^I will see my comment$/ do
  current_path = URI.parse(current_url).path
  current_path.should == level_comments_path(@assignment)
end
