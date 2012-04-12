Feature: Teacher comments on Level
  As a teacher
  I want to add comments to a level
  So that I can provide feedback to the students

  Scenario: Comment on Level
    Given I am logged in as a teacher
      And There is an assignment with a level
     When I visit the assignment
      And I post a comment
     Then I will see my comment

