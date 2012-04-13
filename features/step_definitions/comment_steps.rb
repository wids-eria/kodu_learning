Given /^There is an assignment with a level$/ do
  @assignment = Factory :assignment
  @level = Factory :level, assignment: @assignment
end

When /^I visit the assignment$/ do
  visit assignment_path(@assignment)
end

When /^I post a comment$/ do
  click_on 'Comments'
  click_on 'New Comment'
  fill_in 'Body', with: 'xyzxyz'
  click_button 'Create Comment'
end

Then /^I will see my comment$/ do
  current_path = URI.parse(current_url).path
  current_path.should == level_comments_path(@level)

  page.should have_content("xyzxyz")
end

Given /^There is an assignment with my level$/ do
  @assignment = Factory :assignment
  @level = Factory :level, assignment: @assignment, user: @user
end

Then /^I will not see the comment link$/ do
  page.should_not have_content("Comments")
end

Given /^I have a comment on the level$/ do
  @comment = Factory :comment, level: @level, author: @user
end

When /^I visit the level comments$/ do
  @response = visit level_comments_path(@level)
end

Then /^I should see the comment$/ do
  page.should have_content(@comment.body)
end
