@javascript @broacast @twitter @mail
Feature: Tests trying out broadcasts; creating new (valid,
  invalid), deleting and viewing

Background:
  Given a signed in user as admin
  Given the user clicks link "Broadcasts"

#-------------------- Test ID: 77 -------------------#
  Scenario: List broadcasts using link
    Then the user should see list of broadcasts

#-------------------- Test ID: 78 -------------------#
  Scenario: View broadcast using links
    And clicks first "Show" broadcast link
    Then the user should see "Broadcast details"

#-------------------- Test ID: 79 -------------------#
  Scenario: Delete broadcast
    When the user clicks first "Destroy" broadcast link
    And the user clicks ok on confirmation dialog
    Then the user visits broadcast id "1" page
    And the user should see "Broadcast no longer exists"

#-------------------- Test ID: 80 -------------------#
  Scenario: Create new broadcast for all feeds
    When the user clicks link "New broadcast"
    And replaces broadcast content with "#CraigBakes all the cucumbers"
    Then presses "Broadcast"
    And the user should see "Broadcast was successfully saved and broadcast to all feeds"

#-------------------- Test ID: 81 -------------------#
  Scenario: Create new broadcast for twitter
    When the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with "#CraigBakes twitter cucumbers"
    Then presses "Broadcast"
    Then the user should see "Broadcast was successfully saved and broadcast to all feeds"
    And the twitter feed should have the tweet "#CraigBakes twitter cucumbers"

#-------------------- Test ID: 82 -------------------#
  Scenario: Create new broadcast for email
    When the user clicks link "New broadcast"
    Then the user unchecks the "twitter" checkbox
    And replaces broadcast content with "idUnique ab12 #CraigBakes email cucumbers"
    Then presses "Broadcast"
    Then the user should see "Broadcast was successfully saved and broadcast to all feeds"
    Then an email should be received

#-------------------- Test ID: 83 -------------------#
  Scenario: Create new broadcast too long for twitter
    When the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with long string
    Then presses "Broadcast"
    Then the user should see "1 error prohibited this broadcast from being saved"

#-------------------- Test ID: 84 -------------------#
  Scenario: Check correct amount of characters twitter broadcast
    When the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with "1234567890"
    Then twitter character count left should be "121"
      #includes time e.g ' 12:00:00'

#-------------------- Test ID: 85 -------------------#
  Scenario: Use shortens URL functionality
    When the user clicks link "New broadcast"
    And replaces URL box with "example.com"
    Then the user clicks link "Shortens URL"
    And URL box contents length should be shorter than "1"

#-------------------- Test ID: 86 -------------------#
  Scenario: Do not post broadcast instead go back
    When the user clicks link "New broadcast"
    And the user clicks link "Back"
    Then the user should see list of broadcasts

#-------------------- Test ID: 87 -------------------#
  Scenario: Attempt to post empty broadcast
    When the user clicks link "New broadcast"
    Then presses "Broadcast"
    Then the user should see "Content can't be blank"
