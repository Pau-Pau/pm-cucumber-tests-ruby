Feature: Create a Process
  In order to test the login page to enter to the app,
  please provide the necessary info, in this case you can login
  As an admin user

  Scenario: Verify that it is possible to login into the app
#    When Login to ProcessMaker app with Administrator credentials
    When The login page of ProcessMaker app is Loaded
    Then Fill the username field with admin
    And Fill the password field with admin
#    Given That the workspace has been selected
    And Select the English language to manage the app
    Then Click on Login button
#    Then The Homepage is displayed
#    And Click on Logout link
#    Then Open Colosa, Inc. page


