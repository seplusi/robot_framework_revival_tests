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
${passwd_input_error_msg}    css:form[class="oxd-form"] > div[class="oxd-form-row"]:nth-of-type(2) span[class*="error"]
${user_input}      css:input[name="username"]
${user_input_error_msg}    css:form[class="oxd-form"] > div[class="oxd-form-row"]:nth-of-type(1) span[class*="error"]
${login_err}    css:p[class*="oxd-alert-content-text"]

*** Keywords ***
Login page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    
    ...    ${username_label}    ${user_input}    ${password_label}    
    ...    ${passwd_input}    ${title}    ${user_icon}    ${passwd_icon}    
    ...    ${login_btn}

Login page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    
    ...    ${username_label}    ${user_input}    ${password_label}    
    ...    ${passwd_input}    ${title}    ${user_icon}    ${passwd_icon}    
    ...    ${login_btn}

Login using user and passwd
    [Arguments]    ${username}    ${passwd}
    Input Text    locator=${user_input}    text=${username}
    Input Text    locator=${passwd_input}    text=${passwd}
    Click Button    locator=${login_btn}

Type username
    [Arguments]    ${username}
    Input Text    locator=${user_input}    text=${username}

Type password
    [Arguments]    ${password}
    Input Text    locator=${passwd_input}    text=${password}

Click login button
    Click Button    locator=${login_btn}

Invalid login with non-empty credentials
    [Arguments]    ${username}    ${passwd}  ${url}  ${expected_err}
    Go To    url=${url}
    Login page is loaded after    10
    Type username    username=${username}
    Type password    password=${passwd}
    Click login button
    Wait Until Element Is Visible    locator=${login_err}
    Element Should Be Visible    locator=${login_btn}
    Element Should Be Visible    locator=${login_err}
    Element Text Should Be    locator=${login_err}    expected=${expected_err}
