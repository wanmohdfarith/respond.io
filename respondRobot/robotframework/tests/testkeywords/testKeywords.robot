*** Settings ***
Documentation  This file will only store keywords for respondio.

*** Keywords ***

Open Respondio Login Page
  Go To  ${login_url}
  Sleep  2

Validate Respondio Login Page
  Wait Until Element Is Visible  ${login_header_logo}
  Element Should Be Visible  ${login_header_info}
  Element Should Be Visible  ${login_form_email_textbox}
  Element Should Be Visible  ${login_form_password_textbox}
  Element Should Be Visible  ${login_form_sigin_button}

Input Valid Credential  [Arguments]  ${emailAddress}  ${password}
  Click Element  ${login_form_email_textbox}
  Input Text  ${login_form_email_textbox}  ${emailAddress}
  Click Element  ${login_form_password_textbox}
  Input Text  ${login_form_password_textbox}  ${password}

Log Into Respondio Home
  Click Element  ${login_form_sigin_button}

Validate Respondio Home Page
  Wait Until Element Is Visible  ${home_banner_intro}
  Element Should Be Visible  ${home_header_info_arrow}
  Capture Page Screenshot

Logout from Respondio
  Click Element  ${home_header_info_arrow}
  Wait Until Element Is Visible  ${home_logout_button}
  Click Element  ${home_logout_button}
