Given /^I want to sign up$/ do
  visit root_path
  click_on "Register"
end

When /^I register$/ do
  fill_in 'Email', with: 'email@test.com'
  fill_in 'Gamer tag', with: 'hipster_gamer'
  fill_in 'Password', with: 'pass1234'
  fill_in 'Password confirmation', with: 'pass1234'
  click_button 'Sign up'
end

Then /^I will be registered and logged in$/ do
  page.should have_content(I18n.t('devise.registrations.signed_up'));
  user = User.last
  user.email.should == "email@test.com"
  user.gamer_tag.should == "hipster_gamer"
end

Given /^I want to log in$/ do
  @user = Factory :user
  visit root_path
end

When /^I enter my credentials$/ do
  fill_in 'Login', with: @user.gamer_tag
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
end

Then /^I will be logged in$/ do
  page.should have_content(I18n.t('devise.sessions.signed_in'));
  User.find(@user).last_sign_in_at.should_not be_nil
end

Given /^I am logged in$/ do
  step "I want to log in"
  step "I enter my credentials"
end

Given /^I visit my profile$/ do
  visit edit_user_registration_path
  current_path = URI.parse(current_url).path
  current_path.should == edit_user_registration_path
end

When /^I change my gamer tag$/ do
  fill_in 'Gamer tag', with: 'super_hipster_gamer'
  fill_in 'Current password', with: @user.password
  click_button 'Update'
end

Then /^I will have a new gamer tag$/ do
  user = User.last
  user.gamer_tag.should == "super_hipster_gamer"
end

Given /^I have a user with no gamer tag$/ do
  User.where(id: @user.id).update_all(gamer_tag: nil)
end

When /^I visit the homepage$/ do
  visit root_path
end

Then /^I will be forced to change my gamer tag$/ do
  current_path = URI.parse(current_url).path
  current_path.should == edit_user_registration_path
end
