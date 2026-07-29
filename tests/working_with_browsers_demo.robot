*** Settings ***
Library  SeleniumLibrary
Test Teardown  Close All Browsers

*** Variables ***
${url}      http://www.google.com
${browser}  chrome

*** Test Cases ***
Test case to demostrate Browser Operation Keywords in Robot Framework
    Open Browser  ${url}  ${browser}  ChromeRCV
    Maximize Browser Window
    Open Browser  about:blank  ${browser}
    
    &{alias}  Get Browser Aliases
    # &{alias] = {'ChromeRCV': 1}
    Log To Console  ${alias.ChromeRCV}

    @{browser_ids}  Get Browser Ids
    # @{browser_ids} = [1, 2]  ID 1 for google browser. ID 2 for blank browser
    Log To Console  Browser IDs = @{browser_ids}

    @{locations}  Get Locations  ALL
    # ['https://www.google.com/', 'about:blank']. There's a relation between locations and IDs.
    # ID 1 (${browser_ids}[0]) has URL 'https://www.google.com/' (${locations}[0])
    Log To Console  @{locations}

    @{current_loc}  Get Locations  CURRENT
    Log To Console  ${current_loc}
    Should Be Equal As Strings  ${current_loc}[0]  ${locations}[1]

    Switch Browser  1
    @{current_loc}  Get Locations  CURRENT
    Log To Console  ${current_loc}
    Should Be Equal As Strings  ${current_loc}[0]  ${locations}[0]