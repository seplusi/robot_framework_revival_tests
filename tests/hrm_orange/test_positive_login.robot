*** Settings ***
Library    SeleniumLibrary
Library    String
Test Setup    Open Browser    browser=chrome    url=${url}
Test Teardown    Close Browser
Resource    ../../resources/login_page_object.resource
Resource    ../../resources/dashboard/dashboard_admin_page_object.robot
Resource    ../../resources/dashboard/dashboard_user_page_object.robot
Resource    ../../resources/sidepanel/sidepanel_user_page_object.robot
Resource    ../../resources/sidepanel/sidepanel_admin_page_object.robot
Resource    ../../resources/user_menu/user_menu_page_object.resource

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

Validate successful Admin login
    Login page is loaded after some time
    Type username    Admin
    Type password    admin123
    Click login button
    Dashboard Admin page is loaded after some time

Validate successful Admin login while specifying page load timeout
    Login page is loaded after    timeout=10
    Input Text    locator=${user_input}    text=Admin
    Input Text    locator=${passwd_input}    text=admin123
    Click Button    locator=${login_btn}
    Dashboard Admin page is loaded after    timeout=10    

Validate Admin Dashboard page
    Login page is loaded after some time
    Login using user and passwd    Admin    admin123
    Sidepanel admin page is loaded after some time
    Dashboard Admin page is loaded after some time
    Element Text Should Be    locator=${dash_title}    expected=Dashboard
    Element Text Should Be    locator=${upgrade_btn}    expected=Upgrade
    Element Text Should Be    locator=${time_at_work_header}    expected=Time at Work
    ${text}=  Get Text    locator=${user_dropdown_name}
    Should Match Regexp    string=${text}    pattern=^[A-Z][a-zÀ-ÿ]* [A-Z][a-z]*$

Validate successful user login
    Login page is loaded after some time
    Login using user and passwd    seplusi1    12QWaszx
    Sidepanel user page is loaded after some time
    Dashboard user page is loaded after some time
    Element Should Not Be Visible    locator=${upgrade_btn}
    Element Text Should Be    locator=${dash_title}    expected=Dashboard
    Element Text Should Be    locator=${user_dropdown_name}    expected=Jack Bauer
    Element Text Should Be    locator=${time_at_work_header}    expected=Time at Work
    Click Button    locator=${chevron_left}
    Wait Until Element Is Not Visible    ${sidepanel_brand}
    Wait Until Element Is Not Visible    ${search_text_box}
    Elements Should Not Be Visible    ${buzz_legend}  ${leave_legend}
    ...    ${time_legend}  ${my_info_legend}  ${perform_legend}
    ...    ${dashboard_legend}  ${directory_legend}  ${claim_legend}
    ...    ${buzz_legend}
    Click Button    locator=${chevron_left}
    Sidepanel user page is loaded after some time
    Dashboard user page is loaded after some time

Validate successful user logout
    Login page is loaded after some time
    Login using user and passwd    seplusi1    12QWaszx
    Sidepanel user page is loaded after some time
    Dashboard user page is loaded after some time
    Click Element    locator=${userdropdown-icon}
    User menu page is loaded after some time
    Element Text Should Be    locator=${about}    expected=About
    Element Text Should Be    locator=${support}  expected=Support
    Element Text Should Be    locator=${chg_passwd}  expected=Change Password
    Element Text Should Be    locator=${logout}      expected=Logout
    Click Element  ${logout}
    Login page is loaded after some time