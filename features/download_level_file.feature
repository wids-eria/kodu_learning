Feature: Download level file
  In order to obtain a copy of my, or someone else's level file
  As any kind of user
  I want to download an attached level file

  Scenario: download an attached level file
    Given a level exists with attached level file "example_level.Kodu"
    When I am on the levels page
      And I follow "Download"
    Then I receive a copy of "example_level.Kodu"
