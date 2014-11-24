@javascript
Feature: Access to pages tests

#-------------------- Test ID: 8 -------------------#
  Scenario: View another user using ID as none-admin
    Given a signed in user with username "TestUser" and password "test"
    Then the user visits user id "1" page
    Then the user should see "You must be admin to do that"

#-------------------- Test ID: 9 -------------------#
  Scenario: View user using ID when not logged in
    Then the user visits user id "41" page
    Then the user should see "Please log in"

#-------------------- Test ID: 10 -------------------#
  Scenario: List users using link as none-admin
    Given a signed in user with username "cwl11" and password "secret"
    Then the user goes to the users page
    Then the user should see "No permission"

#-------------------- Test ID: 11 -------------------#
  Scenario: View user using ID as none-admin
    Given a signed in user with username "cwl11" and password "secret"
    Then the user visits user id "41" page
    Then the user should see "This is not your account, access denied"

#-------------------- Test ID: 12 -------------------#
  Scenario: View broadcasts page using address bar as none-admin
    Given a signed in user with username "cwl11" and password "secret"
    Then the user goes to the broadcasts page
    Then the user should see "You must be admin to do that"

#-------------------- Test ID: 13 -------------------#
  Scenario: View broadcasts using address bar when not logged in
    Then the user goes to the broadcasts page
    Then the user should see "Please log in"

#-------------------- Test ID: 19 -------------------#
  Scenario: View user using ID
    Then the user visits user id "41" page
    Then the user should see "Back"

#-------------------- Test ID: 46 -------------------#
  Scenario: List users using link not signed in
    Then the user goes to the users page
    Then the user should see "Please log in"
