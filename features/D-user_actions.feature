@javascript @users @details
Feature: Various tasks concerning the list of, and individual
  users; editing, creating(with and without valid information)
  and deleting users- actions on users etc possible because
  test data is copied from development db to test db (see
  env.rb in support folder)

Background:
  Given a signed in user as admin
  Then the user clicks link "Users"

#-------------------- Test ID: 20 -------------------#
  Scenario: List users using link
		Given the user should see list of users

#-------------------- Test ID: 21 -------------------#
	Scenario: View user using links
		Given the user clicks first "Show" user link
		Then the user should see "Close"

#-------------------- Test ID: 22 -------------------#
	Scenario: Edit user with valid information
		Given the user clicks first "Edit" user link
		And replaces surname with "Testing"
		Then the user presses "Update"
		Then the user should see "Testing"
		And the user should see "Account was successfully updated"

#-------------------- Test ID: 23 -------------------#
  Scenario: Edit user with missing surname
		Given the user clicks first "Edit" user link
		And replaces surname with ""
		And the user presses "Update"
    Then the user should see "Surname can't be blank"

#-------------------- Test ID: 24 -------------------#
  Scenario: Edit user with missing forename
		Given the user clicks first "Edit" user link
		And replaces forename with ""
		And the user presses "Update"
    Then the user should see "Firstname can't be blank"

#-------------------- Test ID: 25 -------------------#
  Scenario: Edit user with missing email
		Given the user clicks first "Edit" user link
		And replaces email with ""
		And the user presses "Update"
    Then the user should see "Email can't be blank"

#-------------------- Test ID: 26 -------------------#
  Scenario: Edit user with invalid email format
		Given the user clicks first "Edit" user link
		And replaces email with "testNotEmail"
		And the user presses "Update"
    Then the user should see "Bad email address format"

#-------------------- Test ID: 27 -------------------#
  Scenario: Edit user with word as phone number
    Given the user clicks first "Edit" user link
    And replaces phone with "test"
    And the user presses "Update"
    Then the user should see "Phone is invalid"

#-------------------- Test ID: 28 -------------------#
  Scenario: Edit user with missing phone
		Given the user clicks first "Edit" user link
		And replaces phone with ""
		And the user presses "Update"
    And the user should see "Account was successfully updated"

#-------------------- Test ID: 29 -------------------#
  Scenario: Edit user with missing grad year
		Given the user clicks first "Edit" user link
		And replaces grad year with ""
		And the user presses "Update"
    Then the user should see "Grad year can't be blank"

#-------------------- Test ID: 30 -------------------#
  Scenario: Edit user with too low grad year
		Given the user clicks first "Edit" user link
		And replaces grad year with "1900"
		And the user presses "Update"
    Then the user should see "Grad year must be greater than or equal to 1970"

#-------------------- Test ID: 31 -------------------#
  Scenario: Edit user with letter as grad year
		Given the user clicks first "Edit" user link
		And replaces grad year with "abc"
		And the user presses "Update"
    Then the user should see "Grad year is not a number"

#-------------------- Test ID: 32 -------------------#
  Scenario: Check the user jobs checkbox and save
    Given the user clicks first "Edit" user link
    Then the user checks the "jobs" checkbox
    And the user presses "Update"
    Then the user should see "Jobs: true"

#-------------------- Test ID: 33 -------------------#
  Scenario: Delete user
    Given the user clicks first "Destroy" user link
    And the user clicks ok on confirmation dialog
    Then the user visits user id "42" page
    And the user should see "Account no longer exists"

#-------------------- Test ID: 34 -------------------#
  Scenario: Create new user with valid information
    Given the user clicks link "New User"
    Then the user fills in all valid details
    Then presses "Create"
    Then the user visits user id "43" page
    Then the user should see "User Anothertest"

#-------------------- Test ID: 35 -------------------#
  Scenario: Create new user with no information
    Given the user clicks link "New User"
    And presses "Create"
    Then the user should see "10 errors prohibited this user from being saved"

#-------------------- Test ID: 36 -------------------#
  Scenario: Create new user with no forename
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces forename with ""
    Then presses "Create"
    Then the user should see "Firstname can't be blank"

#-------------------- Test ID: 37 -------------------#
  Scenario: Create new user with no surname
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces surname with ""
    And replaces password confirmation with "test"
    Then presses "Create"
    Then the user should see "Surname can't be blank"

#-------------------- Test ID: 38 -------------------#
  Scenario: Create new user with no email
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces email with ""
    Then presses "Create"
    Then the user should see "Email can't be blank"

#-------------------- Test ID: 39 -------------------#
  Scenario: Create new user with no grad year
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces grad year with ""
    Then presses "Create"
    Then the user should see "Grad year can't be blank"

#-------------------- Test ID: 40 -------------------#
  Scenario: Create new user with invalid email
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces email with "crh"
    Then presses "Create"
    Then the user should see "Bad email address format"

#-------------------- Test ID: 41 -------------------#
  Scenario: Create new user with invalid phone
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces phone with "hello"
    Then presses "Create"
    Then the user should see "Phone is invalid"

#-------------------- Test ID: 42 -------------------#
  Scenario: Create new user with jobs selected
    Given the user clicks link "New User"
    And the user fills in all valid details
    Then the user checks the "jobs" checkbox
    And presses "Create"
    Then the user visits user id "43" page
    And the user should see "Jobs: true"

#-------------------- Test ID: 43 -------------------#
  Scenario: Create new user with no jobs selected
    Given the user clicks link "New User"
    And the user fills in all valid details
    Then presses "Create"
    Then the user visits user id "43" page
    Then the user should see "Jobs: false"

#-------------------- Test ID: 44 -------------------#
  Scenario: Create new user without saving
    Given the user clicks link "New User"
    And the user fills in all valid details
    Then the user clicks link "Back"
    And the user visits user id "43" page
    Then the user should see "Account no longer exists"

#-------------------- Test ID: 45 -------------------#
  Scenario: Create new user with matching details
    Given the user clicks link "New User"
    Then the user fills in all details matching another user
    And presses "Create"
    Then the user should see "User detail login has already been taken"

#-------------------- Test ID: 46-47 -------------------#
  Scenario Outline: Create new user with invalid confirmation password
    Given the user clicks link "New User"
    Then the user fills in all valid details
    And replaces password confirmation with <passwordConfirm>
    Then presses "Create"
    Then the user should see <error>
    Examples:
    | passwordConfirm |                            error                         |
    |""               |"User detail password confirmation can't be blank"|
    |"wrong"          |"User detail password confirmation doesn't match Password"|

#-------------------- Test ID: 48-49 -------------------#
  Scenario Outline: Search for users using forename
    When replaces user search box with <firstname>
    Then presses "Search"
    Then the user should see <result>
    Examples:
    | firstname |       result      |
    |"chris"    |"Displaying 1 User"|
    |"falseuser"|"No entries found" |

#-------------------- Test ID: 50-51 -------------------#
  Scenario Outline: Search for users using surname
    When replaces user search box with <surname>
    Then presses "Search"
    Then the user should see <result>
    Examples:
    |  surname  |       result       |
    |"loftus"   |"Displaying 1 User" |
    |"falseuser"|"No entries found"  |

#-------------------- Test ID: 52-53 -------------------#
  Scenario Outline: Search for users using grad year
    When replaces user search box with <gradYear>
    Then presses "Search"
    Then the user should see <result>
    Examples:
    | gradYear |                result                |
    |"1985"    |"Displaying User 1 - 6 of 41 in total"|
    |"1234"    |"No entries found"                    |

#-------------------- Test ID: 54-55 -------------------#
  Scenario Outline: Search for users using phone
    When replaces user search box with <phone>
    Then presses "Search"
    Then the user should see <result>
    Examples:
    |     phone    |                  result              |
    |"01970 622422"|"Displaying User 1 - 6 of 41 in total"|
    |"999999"      |"No entries found"                    |

#-------------------- Test ID: 56-57 -------------------#
  Scenario Outline: Search for users using email
    When replaces user search box with <email>
    Then presses "Search"
    Then the user should see <result>
    Examples:
    |        email      |        result     |
    |"cwl@aber.ac.uk"   |"Displaying 1 User"|
    |"false@false.false"|"No entries found" |

#-------------------- Test ID: 58 -------------------#
  Scenario: Search for users using empty string
    When replaces user search box with ""
    Then presses "Search"
    Then the user should see "Displaying User 1 - 6"

#-------------------- Test ID: 59-63 -------------------#
  Scenario Outline: Search user using forename with different checkboxes selected
    When replaces user search box with "chris"
    Then the user checks the <checkbox> checkbox
    And presses "Search"
    Then the user should see <result>
    Examples:
    |  checkbox  |       result      |
    |"firstname" |"Displaying 1 User"|
    |"surname"   |"No entries found" |
    |"email"     |"No entries found" |
    |"phone"     |"No entries found" |
    |"grad year" |"No entries found" |

#-------------------- Test ID: 64-69 -------------------#
  Scenario Outline: Search user using forename with all checkboxes selected
    When replaces user search box with <text>
    And the user checks all the search checkboxes
    Then presses "Search"
    Then the user should see <result>
    Examples:
    |       text     |                  result              |
    |"chris"         |"Displaying 1 User"                   |
    |"loftus"        |"Displaying 1 User"                   |
    |"cwl@aber.ac.uk"|"Displaying 1 User"                   |
    |"01970 622422"  |"Displaying User 1 - 6 of 41 in total"|
    |"1985"          |"Displaying User 1 - 6 of 41 in total"|
    |"flasedata"     |"No entries found"                    |

#-------------------- Test ID: 70 -------------------#
  Scenario: Browse users using pagination
    When the user clicks link "2"
    Then the user should see "Displaying User 7 - 12"

#-------------------- Test ID: 71 -------------------#
  Scenario: Browse users using next page button
    When the user clicks link "Next →"
    Then the user should see "Displaying User 7 - 12"

#-------------------- Test ID: 72 -------------------#
  Scenario: Browse users using previous page button
    When the user clicks link "Next →"
    Then the user should see "Displaying User 7 - 12"
    And the user clicks link "← Previous"
    Then the user should see "Displaying User 1 - 6"

#-------------------- Test ID: 73-76 -------------------#
  Scenario Outline: Browse users using pagination address
    When the user goes to the user page <page> through address bar
    Then the user should see <message>
    Examples:
    | page |           message      |
    |"2"   |"Displaying User 7 - 12"|
    |"999" |"Displaying User 1 - 6" |
    |"one" |"Displaying User 1 - 6" |
    |""    |"Displaying User 1 - 6" |
