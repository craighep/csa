@javascript @images
Feature: Image upload tests, checking images are correctly saved

Background:
  Given a signed in user as admin
  And the user clicks link "Profile"
  And the user clicks link "Edit"

#-------------------- Test ID: 88 -------------------#
  Scenario: Upload and check image exists
    Given the user uploads an image
    And the user presses "Update"
    Then the user should see their image

#-------------------- Test ID: 89 -------------------#
  Scenario: Upload already exiting image
    Given the user visits user id "40" page
    And the user clicks link "Edit"
    And the user uploads an image
    And the user presses "Update"
    # Done twice, to check if both users allowed same image(storage issues etc.)
    And the user clicks link "Profile"
    And the user clicks link "Edit"
    Then the user uploads an image another user has
    And the user presses "Update"
    Then the user should see their image

#-------------------- Test ID: 90 -------------------#
  Scenario: Attempt to upload a none-image file
    Given the user uploads a none-image
    And the user presses "Update"
    Then the user should still see a blank picture
