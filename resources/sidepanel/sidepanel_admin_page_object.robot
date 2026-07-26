*** Settings ***
Resource    sidepanel_common_page_object.robot

*** Variables ***
${admin_btn}    css:a[href*="viewAdminModule"]
${pim_btn}    css:a[href*="viewPimModule"]
${recruit_btn}    css:a[href*="viewRecruitmentModule"]
${mntn_btn}    css:a[href*="viewMaintenanceModule"]

*** Keywords ***
Sidepanel admin page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Sidepanel admin page is loaded after    timeout=${timeout}

Sidepanel admin page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}    ${sidepanel_brand}    ${chevron_left}    
    ...    ${search_text_box}    ${leave_btn}    ${time_btn}    ${my_info_btn}    
    ...    ${perform_btn}    ${dashboard_btn}    ${directory_btn}    ${claim_btn}    
    ...    ${buzz_btn}    ${admin_btn}    ${pim_btn}    ${recruit_btn}
    ...    ${mntn_btn} 