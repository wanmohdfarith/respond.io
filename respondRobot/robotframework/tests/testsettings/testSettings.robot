*** Settings ***
Documentation    This file will store the configuration.

Library  Selenium2Library

Resource  ../testvariables/testVariables.robot
Resource  ../testkeywords/testKeywords.robot

*** Variables ***

${delay}  1
${baseURL}  about:blank
${remote_url}  None
${headless}  Yes
${browser}  chrome

*** Keywords ***

TestCase Setup
  Set Selenium Speed  ${DELAY}
  Run Keyword If  "${browser}"=="chrome"  Setup Chrome Browser
  ...  ELSE IF  "${browser}"=="chromemobile"  Setup Chrome Mobile Browser
  # Maximize Browser Window
  Set Window Size  1366  768

Setup Chrome Mobile Browser
  Run Keyword If  "${remote_url}"=="None"  Run Chrome Mobile In Local
  ...  ELSE  Run Chrome Mobile In Remote

Run Chrome Mobile In Local
  ${headlessValue}  Run Keyword If  "${headless}"=="Yes"  Set Variable  --headless
  ${mobile_emulation}  Create Dictionary  deviceName=iPhone 6
  ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method  ${options}  add_experimental_option  mobileEmulation  ${mobile_emulation}
  Call Method  ${options}  add_argument  disable-infobars
  Run Keyword If  "${headlessValue}"=="--headless"  Call Method  ${options}  add_argument  ${headlessValue}
  Call Method  ${options}  add_argument  --disable-gpu
  Create Webdriver  Chrome  chrome_options=${options}

Run Chrome Mobile In Remote
  ${headlessValue}  Run Keyword If  "${headless}"=="Yes"  Set Variable  --headless
  ${mobile_emulation}  Create Dictionary  deviceName=iPhone 6
  ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method  ${options}  add_experimental_option  mobileEmulation  ${mobile_emulation}
  Call Method  ${options}  add_argument  disable-infobars
  Run Keyword If  "${headlessValue}"=="--headless"  Call Method  ${options}  add_argument  ${headlessValue}
  Call Method  ${options}  add_argument  --disable-gpu
  ${options}  Call Method  ${options}  to_capabilities
  ${executor}  Evaluate  str("http://${remote_url}:4444/wd/hub")
  Create Webdriver  Remote  command_executor=${executor}  desired_capabilities=${options}

Setup Chrome Browser
  Run Keyword If  "${remote_url}"=="None"  Run Chrome In Local
  ...  ELSE  Run Chrome In Remote

Run Chrome In Local
  ${headlessValue}  Run Keyword If  "${headless}"=="Yes"  Set Variable  --headless
  ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method  ${options}  add_argument  disable-infobars
  Run Keyword If  "${headlessValue}"=="--headless"  Call Method  ${options}  add_argument  ${headlessValue}
  Call Method  ${options}  add_argument  --disable-gpu
  # ${options}  Call Method  ${options}  to_capabilities
  Create WebDriver  Chrome  chrome_options=${options}

Run Chrome In Remote
  ${headlessValue}  Run Keyword If  "${headless}"=="Yes"  Set Variable  --headless
  ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method  ${options}  add_argument  disable-infobars
  Run Keyword If  "${headlessValue}"=="--headless"  Call Method  ${options}  add_argument  ${headlessValue}
  Call Method  ${options}  add_argument  --disable-gpu
  ${options}  Call Method  ${options}  to_capabilities
  ${executor}  Evaluate  str("http://${remote_url}:4444/wd/hub")
  Create Webdriver  Remote  command_executor=${executor}  desired_capabilities=${options}
