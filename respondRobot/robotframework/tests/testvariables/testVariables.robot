*** Settings ***

Documentation  This file will only store variables for respondio.

*** Variables ***

${login_url}  https://app.respond.io/user/login
${login_header_logo}  //div[@class="wrapper auth-wrapper col"]//div[@class="v-image__image v-image__image--contain"]
${login_header_info}  //div[@class="wrapper auth-wrapper col"]//div[contains(text(),"Sign in to your account")]
${login_form_email_textbox}  //input[@placeholder="Email Address"]
${login_form_password_textbox}  //input[@placeholder="Password"]
${login_form_sigin_button}  //button[@type="submit"]/span[contains(text(),"Sign In")]

${home_banner_intro}  //div[text()="Happy to have you on-board, let's connect a channel."]
${home_header_info_arrow}  //span[@class="v-btn__content"]//span[@class="v-icon notranslate ml-2 v-icon--right v-icon--svg theme--dark"]
${home_logout_button}  //button[@type="button"]/span[contains(text(),"Logout")]
