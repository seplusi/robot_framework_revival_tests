*** Settings ***
Library    SeleniumLibrary
Resource    page_objects_common_keywords.robot

*** Variables ***
${dash_title}    css:h6[class*="topbar"]
${user_dropdown_name}    css:span.oxd-userdropdown-tab > p
${userdropdown-img}    css:img.oxd-userdropdown-img
${userdropdown-icon}    css:i.oxd-userdropdown-icon
${upgrade_btn}    css:button[class*="orangehrm-upgrade-button"]
${time_at_work_header}    css:div[class*="dashboard-grid"] > div:nth-child(1) div[class*="header"] p
