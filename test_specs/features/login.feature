@Login @HomePage
Feature: Login to ProcessMaker app with valid Credentials
  In order to test the login page
  As an admin user
  I want to successful login.

  Scenario Outline: Verify that it is possible to login step by step
    When The login page of ProcessMaker app is Loaded
    Then Fill the username field with <user>
    And Fill the password field with <psw>
    And Select the <lang> language to manage the app
    Then Click on Login button
    And The Homepage is displayed
  Examples:
    | user  | psw   | lang    |
    | admin | admin | English |

  Scenario Outline: Verify that it is possible to login with provided credentials
    When Login to ProcessMaker app with <user>, <psw> credentials and <lang> language
    And The Homepage is displayed

  Examples:
    | user  | psw   | lang    |
    | admin | admin | English |

  Scenario: Verify that it is possible to login directly with Admin credentials
    When Login to ProcessMaker app as Administrator
    And The Homepage is displayed

