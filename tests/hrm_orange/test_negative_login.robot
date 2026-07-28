*** Settings ***
Suite Setup    Open Browser    browser=Chrome    url=${url}    options=add_argument("--guest")
Suite Teardown    Close Browser
Resource    ../../resources/login_page_object.resource

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Test failed login with non-empty credentials
    [Arguments]    ${username}    ${passwd}
    Go To    url=${url}
    Login page is loaded after    10
    Type username    username=${username}
    Type password    password=${passwd}
    Click login button
    Wait Until Element Is Visible    locator=${login_err}
    Element Should Be Visible    locator=${login_btn}
    Element Should Be Visible    locator=${login_err}
    Element Text Should Be    locator=${login_err}    expected=Invalid credentials

Test login with one empty field
    [Arguments]    ${type_field_keyword}    ${locator_with_err}    ${locator_without_err}
    Go To    url=${url}
    Login page is loaded after    10
    Run Keyword     ${type_field_keyword}    blah
    Click login button
    Wait Until Element Is Visible    locator=${locator_with_err}
    Element Should Not Be Visible    locator=${locator_without_err}
    Element Should Be Visible    locator=${login_btn}
    Element Should Not Be Visible    locator=${login_err}
    Element Text Should Be    locator=${locator_with_err}    expected=Required

*** Test Cases ***
Test login without user and password
    Login page is loaded after    10
    Click login button
    Wait Until Element Is Visible    locator=${user_input_error_msg}
    Wait Until Element Is Visible    locator=${passwd_input_error_msg}
    Element Should Be Visible    locator=${login_btn}
    Element Text Should Be    locator=${user_input_error_msg}    expected=Required
    Element Text Should Be    locator=${passwd_input_error_msg}    expected=Required

Test login with empty username
    Test login with one empty field    type_field_keyword=Type password
    ...    locator_with_err=${user_input_error_msg}
    ...    locator_without_err=${passwd_input_error_msg}

Test login with empty password
        Test login with one empty field    type_field_keyword=Type username
    ...    locator_with_err=${passwd_input_error_msg}
    ...    locator_without_err=${user_input_error_msg}

Test login with invalid username
    Test failed login with non-empty credentials    blah    admin123

Test login with invalid password
    Test failed login with non-empty credentials    Admin    123456

Test login with both invalid
    Test failed login with non-empty credentials    blah    blah

