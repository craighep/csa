@javascript @pages
Feature: Testing access to different pages within the system
  depending on the level of user; admin, regular and none-user

#-------------------- Test ID: 8 -------------------#
  Scenario: View another user using ID as none-admin
    Given a signed in user with username "cwl11" and password "secret"
    Then the user visits user id "1" page
    Then the user should see "This is not your account, access denied"

#-------------------- Test ID: 9 -------------------#
  Scenario: View user using ID when not logged in
    When the user visits user id "41" page
    Then the user should see "Please log in"

#-------------------- Test ID: 10 -------------------#
  Scenario: List users using link as none-admin
    Given a signed in user with username "cwl11" and password "secret"
    Then the user goes to the users page
    Then the user should see "You must be admin to do that"

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
    When the user goes to the broadcasts page
    Then the user should see "Please log in"

#-------------------- Test ID: 14 -------------------#
  Scenario: View user using ID
    When the user visits user id "41" page
    Then the user should see "Back"

#-------------------- Test ID: 15 -------------------#
  Scenario: List users using link not signed in
    When the user goes to the users page
    Then the user should see "Please log in"

#-------------------- Test ID: 16 -------------------#
  Scenario: View broadcast using ID
    Given a signed in user as admin
    And the user visits broadcast id "1" page
    Then the user should see "Broadcast details"
    Then the user clicks link "Back"
    And the user should see list of broadcasts
