@javascript
Feature: Broadcast list actions

Background:
  Given a signed in user as admin

#-------------------- Test ID: 77 -------------------#
  Scenario: List broadcasts using link
    Given the user clicks link "Broadcasts"
    Then the user should see list of broadcasts

#-------------------- Test ID: 78 -------------------#
  Scenario: View broadcast using links
    Given the user clicks link "Broadcasts"
    And clicks first "Show" user link
    Then the user should see "Broadcast details"

#-------------------- Test ID: 79 -------------------#
  Scenario: View broadcast using ID
    Given the user visits broadcast id "10" page
    Then the user should see "Broadcast details"
    Then the user clicks link "Back"
    And the user should see list of broadcasts

#-------------------- Test ID: 80 -------------------#
  Scenario: Delete broadcast
    Given the user clicks link "Broadcasts"
    Then clicks first "Destroy" broadcast link
    And the user clicks ok on confirmation dialog
    Then the user visits broadcast id "10" page
    And the user should see "Broadcast no longer exists"

#-------------------- Test ID: 81 -------------------#
  Scenario: Create new broadcast for all feeds
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    And replaces broadcast content with "#CraigBakes all the cucumbers"
    Then presses "Broadcast"
    Then the user should see "Broadcast was successfully saved and broadcast to all feeds"

#-------------------- Test ID: 82 -------------------#
  Scenario: Create new broadcast for twitter
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with "#CraigBakes twitter cucumbers"
    Then presses "Broadcast"
    Then the user should see "Broadcast was successfully saved and broadcast to all feeds"
    And the twitter feed should have the tweet

#-------------------- Test ID: 83 -------------------#
  Scenario: Create new broadcast for email
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    Then the user unchecks the "twitter" checkbox
    And replaces broadcast content with "#CraigBakes email cucumbers"
    Then presses "Broadcast"
    Then the user should see "Broadcast was successfully saved and broadcast to all feeds"
    Then an email should be received

#-------------------- Test ID: 84 -------------------#
  Scenario: Create new broadcast too long for twitter
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with long string
    Then presses "Broadcast"
    Then the user should see "1 error prohibited this broadcast from being saved"

#-------------------- Test ID: 85 -------------------#
  Scenario: Check correct amount of characters twitter broadcast
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    Then the user unchecks the "mail" checkbox
    And replaces broadcast content with "1234567890"
    Then twitter character count left should be "124"
      #includes time e.g ' 12:00'
#-------------------- Test ID: 86 -------------------#
  Scenario: Use shortens URL functionality
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    And replaces URL box with "example.com"
    Then the user clicks link "Shortens URL"
    Then URL box should not be empty
    And URL box contents length should be shorter than "9"

#-------------------- Test ID: 87 -------------------#
  Scenario: Do not post broadcast instead go back
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    And the user clicks link "Back"
    Then the user should see list of broadcasts

#-------------------- Test ID: 88 -------------------#
  Scenario: Attempt to post empty broadcast
    Given the user clicks link "Broadcasts"
    Then the user clicks link "New broadcast"
    Then presses "Broadcast"
    Then the user should see "1 error prohibited this broadcast from being saved"
