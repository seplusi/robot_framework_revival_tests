*** Settings ***
Resource    ../page_objects_common_keywords.robot

*** Variables ***
${about}       css:ul[role="menu"] a[href="#"]
${support}     css:ul[role="menu"] a[href*="support"]
${chg_passwd}  css:ul[role="menu"] a[href*="Password"]
${logout}      css:ul[role="menu"] a[href*="logout"]

*** Keywords ***
User menu page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    User menu page is loaded after    timeout=${timeout}

User menu page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time  ${timeout}  ${about}  ${support}
    ...    ${chg_passwd}  ${logout}