@Designer
Feature: Create a Process
  In order to test the Process creation
  As an admin user

  Scenario: Verify that it is possible to create a Process
    When Login to ProcessMaker app with admin, admin credentials and English language
    And Go to DESIGNER menu
    And Open a new Process pop-up
    Then Fill the required fields
    And Create the Process clicking on the 'Create' button
    Then The Process just created should be displayed in the list



