*** Settings ***
Library    SeleniumLibrary
Resource    page_objects_common_keywords.robot

*** Variables ***
${username_label}    css:form[class="oxd-form"] > div[class="oxd-form-row"]:nth-of-type(1) label
${password_label}    css:form[class="oxd-form"] > div[class="oxd-form-row"]:nth-of-type(2) label
${title}             css:h5
${user_icon}    css:i[class*="bi-person"]
${passwd_icon}    css:i[class*="bi-key"]
${login_btn}    css:button[type="submit"]
${forgot_passwd}    css:div.orangehrm-login-forgot > p
${passwd_input}    css:input[name="password"]
${user_input}      css:input[name="username"]

*** Keywords ***
Login page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    
    ...    ${username_label}    ${user_input}    ${password_label}    
    ...    ${passwd_input}    ${title}    ${user_icon}    ${passwd_icon}    
    ...    ${login_btn}
