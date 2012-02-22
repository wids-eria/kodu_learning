Feature: Edit profile
  As a user
  I want to edit my profile
  So I can have a gamer tag

  Scenario: Edit my gamer tag
    Given I am logged in
      And I visit my profile
     When I change my gamer tag
     Then I will have a new gamer tag

  Scenario: Login with no gamer tag set
    Given I am logged in
      And I have a user with no gamer tag
     When I visit the homepage
     Then I will be forced to change my gamer tag
     When I change my gamer tag
     Then I will have a new gamer tag
