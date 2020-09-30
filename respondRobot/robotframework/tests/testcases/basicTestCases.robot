*** Settings ***

Documentation   A test suite with various tests for respondio.

#Import
Resource  ../testsettings/testSettings.robot

#Setup/Tear Down
Test Setup  Test Case Setup
Test Teardown  Close Browser

*** Test Cases ***

Test Case One
  Open Respondio Login Page
  Validate Respondio Login Page
  Input Valid Credential  ${emailAddress}  ${password}
  Capture Page Screenshot
  Log Into Respondio Home
  Validate Respondio Home Page
  Logout from Respondio
