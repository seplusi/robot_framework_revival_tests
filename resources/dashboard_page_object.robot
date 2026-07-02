*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    page_objects_common_keywords.robot

*** Variables ***
${dash_title}    css:h6[class*="topbar"]
${user_dropdown_name}    css:span.oxd-userdropdown-tab> p
${userdropdown-img}    css:img.oxd-userdropdown-img
${userdropdown-icon}    css:i.oxd-userdropdown-icon

*** Keywords ***
Dashboard page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    ${dash_title}    ${user_dropdown_name}    ${userdropdown-icon}    ${userdropdown-img}

Dashboard page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    ${dash_title}    ${user_dropdown_name}    ${userdropdown-icon}    ${userdropdown-img}
