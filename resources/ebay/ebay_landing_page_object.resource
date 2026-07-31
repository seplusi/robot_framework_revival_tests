*** Settings ***
Resource  page_objects_common_keywords.robot

*** Variables ***
${ebay_logo}     css:a[href="https://www.ebay.com"]
${shop_by_cat}   css:button[class="gh-flyout__target"][tabindex]
${search_input}  id:gh-ac
${camera_icon}   css:button[aria-label="Camera icon"]
${all_cat}       id:gh-cat
${search_btn}    id:gh-search-btn

# Footer elements
${footer_buy}  css:h3 > a[href*="all-categories"]
${footer_sitemap}  css:li[class*="big-links"] > a[href*="sitemap.html"]
${footer_safety_tips}  css:li[class*="big-links"] > a[href*="safetytips"]

*** Keywords ***
Ebay landing page is loaded after some time
    ${timeout}=    Get Selenium Timeout
    Ebay landing page is loaded after  timeout=${timeout}

Ebay landing page is loaded after
    [Arguments]    ${timeout}
    Log To Console    message=Page load timeout is ${timeout}
    Page is loaded after time    ${timeout}  ${ebay_logo}   ${shop_by_cat}
    ...    ${search_input}  ${camera_icon}  ${all_cat}  ${search_btn}
