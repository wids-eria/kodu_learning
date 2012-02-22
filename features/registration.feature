Feature: User signs up
  As a student
  I want to sign up for Project K
  So that I may participate in the kodu assignments

  Scenario: New User Registration
    Given I want to sign up
     When I register
     Then I will be registered and logged in

  Scenario: Sign in via gamer tag
    Given I want to log in
     When I enter my credentials
     Then I will be logged in

    
