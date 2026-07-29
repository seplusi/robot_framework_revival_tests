*** Settings ***
Library  ../resources/custom_library/lines.py
Library  ../resources/custom_library/selenium_custom_lib.py
Library  SeleniumLibrary
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

Failing
    ${result}  Lines should be shorter than  ${STRING}  ${20}
    Log To Console  ${result}

All flyouts from ebay are shorter than 20
    Open Browser  browser=chrome  url=${URL}
    Wait Until Element Is Visible  css:ul.vl-flyout-nav__container  timeout=30
    Get all elements that have selector  li[class*="vl-flyout-nav__js-tab"]