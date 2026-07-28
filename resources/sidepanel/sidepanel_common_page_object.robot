*** Settings ***
Library    SeleniumLibrary
Resource    ../page_objects_common_keywords.robot

*** Variables ***
${sidepanel_brand}    css:a[class="oxd-brand"]
${chevron_left}    css:div.oxd-main-menu-search > button
${search_text_box}    css:input[class*="oxd-input"]
${leave_btn}    css:a[href*="viewLeaveModule"]
${leave_legend}    css:a[href*="viewLeaveModule"] > span
${time_btn}    css:a[href*="viewTimeModule"]
${time_legend}    css:a[href*="viewTimeModule"] > span
${my_info_btn}    css:a[href*="viewMyDetails"]
${my_info_legend}    css:a[href*="viewMyDetails"] > span
${perform_btn}    css:a[href*="viewPerformanceModule"]
${perform_legend}    css:a[href*="viewPerformanceModule"] > span
${dashboard_btn}    css:a[href*="dashboard"]
${dashboard_legend}    css:a[href*="dashboard"] > span
${directory_btn}    css:a[href*="viewDirectory"]
${directory_legend}    css:a[href*="viewDirectory"] > span
${claim_btn}    css:a[href*="viewClaimModule"]
${claim_legend}    css:a[href*="viewClaimModule"] > span
${buzz_btn}    css:a[href*="viewBuzz"]
${buzz_legend}    css:a[href*="viewBuzz"] > span