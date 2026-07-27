*** Settings ***
Resource    sidepanel_common_page_object.robot

*** Keywords ***
Sidepanel user page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Sidepanel user page is loaded after    timeout=${timeout}

Sidepanel user page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    ${sidepanel_brand}    ${chevron_left}    
    ...    ${search_text_box}    ${leave_btn}    ${time_btn}    ${my_info_btn}    
    ...    ${perform_btn}    ${dashboard_btn}    ${directory_btn}    ${claim_btn}    
    ...    ${buzz_btn}    