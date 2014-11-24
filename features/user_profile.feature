@javascript
Feature: User list actions

#-------------------- Test ID: 14 -------------------#
  Scenario: View profile using link as regular user
    Given a signed in user with username "TestUser" and password "test"
    Then the user clicks link "Profile"
    Then the user should see "Test User"

#-------------------- Test ID: 15 -------------------#
  Scenario: View profile using link as admin user
    Given a signed in user as admin
    Then the user clicks link "Profile"
    Then the user should see "Chris Loftus"

#-------------------- Test ID: 16 -------------------#
  Scenario: Go back after viewing profile
    Given a signed in user as admin
    Then the user clicks link "Profile"
    Then the user clicks link "Back"
    Then the user should see "Welcome to CS-Alumni News"
