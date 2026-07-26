*** Settings ***
Library    SeleniumLibrary
Resource    page_objects_common_keywords.robot

*** Variables ***
${sidepanel_brand}    css:a[class="oxd-brand"]
${chevron_left}    css:i[class*="bi-chevron-left"]
${search_text_box}    css:input[class*="oxd-input"]
${leave_btn}    css:a[href*="viewLeaveModule"]
${time_btn}    css:a[href*="viewTimeModule"]
${my_info_btn}    css:a[href*="viewMyDetails"]
${perform_btn}    css:a[href*="viewPerformanceModule"]
${dashboard_btn}    css:a[href*="dashboard"]
${directory_btn}    css:a[href*="viewDirectory"]
${claim_btn}    css:a[href*="viewClaimModule"]
${buzz_btn}    css:a[href*="viewBuzz"]