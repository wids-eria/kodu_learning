Feature: Student comments on Level
  As a student
  I want to add comments to a level
  So that I can respond to teachers

  Background: Logged in student
    Given I am logged in as a student

  Scenario: Comment on my Level
    Given There is an assignment with my level
     When I visit the assignment
      And I post a comment
     Then I will see my comment

  Scenario: Comment on someone elses Level
    Given There is an assignment with a level
     When I visit the assignment
     Then I will not see the comment link

  Scenario: Show comments on my level
    Given There is an assignment with my level
      And I have a comment on the level
     When I visit the level comments
     Then I should see the comment
