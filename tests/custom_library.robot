*** Settings ***
Library  SeleniumLibrary
Library  ../resources/custom_library/lines.py
Library  ../resources/custom_library/selenium_custom_lib.py
Resource  ../resources/ebay/ebay_landing_page_object.resource
Suite Teardown  Close Browser

*** Variables ***
${STRING}    SEPARATOR=\n
...    This is short. 
...    This is OK too. 
...    This line is pretty long. 
...    OK again. 
...    Yet another longer line.

${URL}  https://www.ebay.com

*** Test Cases ***
Passing 1
    ${result}  Lines should be shorter than  ${STRING}  ${80}
    Log To Console  ${result}

Passing 2
    ${result}  Lines should be shorter than  ${STRING}  ${80}
    Log To Console  ${result}
    Should Be Equal As Integers  ${0}  ${result}

Failing
    ${result}  Lines should be shorter than  ${STRING}  ${20}
    Log To Console  ${result}
    Should Not Be Equal As Integers  ${0}  ${result}

All flyouts from ebay are shorter than 30
    Open Browser  browser=chrome  url=${URL}
    Ebay landing page is loaded after some time
    Wait Until Element Is Visible  css:ul.vl-flyout-nav__container  timeout=30
    ${ele_text_lst}  Get all elements that have selector  li[class*="vl-flyout-nav__js-tab"]
    ${ele_text_str}  Catenate  SEPARATOR=\n  @{ele_text_lst}
    ${result}  Lines Should Be Shorter Than  ${ele_text_str}  ${40}
    Log To Console  ${ele_text_lst}
    Log To Console  ${result}
    Should Be Equal As Integers  ${result}  ${0}

Test Selenium speed
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    Ebay landing page is loaded after some time
    Wait Until Element Is Visible  ${footer_buy}
    ${selenium_speed}  Get Selenium Speed
    Log To Console  Selenium speed is ${selenium_speed}
    Set Selenium Speed  2
    Scroll Element Into View  ${footer_safety_tips}
    Scroll Element Into View  css:ul.vl-flyout-nav__container
    Mouse Down  ${all_cat}
    Mouse Up  ${all_cat}
    Scroll Element Into View  ${footer_safety_tips}
    Mouse Down On Link  ${footer_sitemap}
    Mouse over  ${footer_buy}
    Mouse Out  ${footer_buy}
    Sleep  1