Feature: Student tags a Level
  As a student
  I want to add tags to a level
  
  Background: Logged in student
    Given I am logged in as a student

  Scenario: Tag new levels uploaded
    Given There is an assignment
    Then I should be able to upload levels with tags

  Scenario: Tag a Level that I uploaded
    Given There is an assignment with my level
     When I visit the assignment
      And I edit my level with a tag
     Then I will see my tags

 
