@javascript
Feature: Log in and out

#-------------------- Test ID: 1 -------------------#
	Scenario: Unsuccessful login
		When a user goes to the login page
		Given a user with username "wrong" and password "wrong"
		And presses Login
		Then the user should see "Couldn't log you in"
		And the user should see "Welcome Guest"

#-------------------- Test ID: 2 -------------------#
	Scenario Outline: Successful login
		Given a user goes to the login page
		And a user with username <username> and password <password>
    And presses Login
		Then the user should see "Logged in successfully"
    Examples:
    |username|password|
    | "admin" |"taliesin"|
    |"cwl11" |"secret"|
    |"cwl5"|"secret"|
    |"cwl13"|"secret"|

#-------------------- Test ID: 3 -------------------#
  Scenario: Successful logout
		Given a signed in user with username "admin" and password "taliesin"
		Then the user presses "Logout"
		And the user should see "Welcome Guest"

#-------------------- Test ID: 4-6 -------------------#
  Scenario Outline: Log in attempt with empty credentials
    When a user goes to the login page
		Given a user with username <username> and password <password>
		And presses Login
		Then the user should see <error>
		Examples:
		| username | password |              error             |
		|  "test1" |    ""    |     "Please enter password"    |
		|    ""    |  "test2" |     "Please enter username"    |
		|    ""    |    ""    |"Please enter login credentials"|

#-------------------- Test ID: 7 -------------------#
	Scenario Outline: Check links availible for each type of user
		When a user goes to the login page
		Given a user with username <username> and password <password>
		And presses Login
		Then the user should see links <pages>
		Examples:
		|username|password|pages|
		|"cwl11"|"secret"|"Home,Jobs,Profile"|
		|"admin"|"taliesin"|"Home,Jobs,Profile,Users,Broadcasts"|
		|""|""|"Home,Jobs"|
