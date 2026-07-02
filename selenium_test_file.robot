*** Settings ***
Library    SeleniumLibrary
Library    String
Test Setup    Open Browser    browser=chrome    url=${url}
Test Teardown    Close Browser
Resource    resources/login_page_object.robot
Resource    resources/dashboard_page_object.robot

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
Validate login page
    ${current_timeout}=    Get Selenium Page Load Timeout
    Log To Console    message=Timeout for document.readyState to reach ${current_timeout}
    ${current_timeout}=    Get Selenium Timeout
    Log To Console    message=Implicit selenium timeout is ${current_timeout}
    # This will fail because the Page Load Timeout only looks at the document.readyState value
    #Element Should Be Visible    locator=${username_label}
    Wait Until Element Is Visible    locator=${username_label}
    Wait Until Element Is Visible    locator=${password_label}
    Wait Until Element Is Visible    locator=${title}
    Wait Until Element Is Visible    locator=${user_icon}
    Wait Until Element Is Visible    locator=${passwd_icon}
    Element Text Should Be    locator=${username_label}    expected=Username
    Element Text Should Be    locator=${password_label}    expected=Password
    Element Text Should Be    locator=${title}    expected=Login
    Element Text Should Be    locator=${login_btn}    expected=Login
    Element Text Should Be    locator=${forgot_passwd}    expected=Forgot your password?

Validate successful login
    Login page is loaded after some time
    Input Text    locator=${user_input}    text=Admin
    Input Text    locator=${passwd_input}    text=admin123
    Click Button    locator=${login_btn}
    Dashboard page is loaded after some time

Validate successful login2
    Login page is loaded after some time
    Input Text    locator=${user_input}    text=Admin
    Input Text    locator=${passwd_input}    text=admin123
    Click Button    locator=${login_btn}
    Dashboard page is loaded after    timeout=10    
