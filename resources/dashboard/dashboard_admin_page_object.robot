*** Settings ***
Resource    dashboard/dashboard_common_page_object.robot

*** Keywords ***
Dashboard Admin page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Dashboard Admin page is loaded after    timeout=${timeout}

Dashboard Admin page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    ${dash_title}    
    ...    ${user_dropdown_name}    ${userdropdown-icon}    
    ...    ${userdropdown-img}    ${upgrade_btn}    ${time_at_work_header}
